require 'openssl'

class User < ApplicationRecord
  ITERATIONS = 20000
  DIGEST = OpenSSL::Digest::SHA256.new
  DEFAULT_COLOR = "#e9ecef"

  attr_accessor :password

  has_many :questions, dependent: :destroy
  has_many :author_quetion, class_name: "Question", foreign_key: "author_id", dependent: :nullify

  validates :email, :username, presence: true
  validates :email, :username, uniqueness: true

  validates :email, email: true
  validates :username, length: { maximum: 40 }
  validates :username, format: { with: /\A[[:alnum:]_]+\z/ }
  validates :color, format: { with: /\A#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})\z/i}

  validates :password, presence: true, on: :create
  validates_confirmation_of :password

  before_validation :username_downcase
  before_save :encrypt_password

  def username_downcase
    username.downcase! if username.present?
  end

  def encrypt_password
    if password.present?
      self.password_salt = User.hash_to_string(OpenSSL::Random.random_bytes(16))
      self.password_hash = User.hash_to_string(
        OpenSSL::PKCS5.pbkdf2_hmac(
          password,
          password_salt,
          ITERATIONS,
          DIGEST.length,
          DIGEST
        )
      )
    end
  end

  def self.hash_to_string(password_hash)
    password_hash.unpack('H*')[0]
  end

  def color
    if self[:color].present?
      self[:color]
    else
      DEFAULT_COLOR
    end
  end

  def self.authenticate(email, password)
    user = find_by(email: email)

    return nil unless user.present?

    hashed_password = User.hash_to_string(
      OpenSSL::PKCS5.pbkdf2_hmac(
        password,
        user.password_salt,
        ITERATIONS,
        DIGEST.length,
        DIGEST
      )
    )
    return user if user.password_hash == hashed_password

    nil
  end
end
