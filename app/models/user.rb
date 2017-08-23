require 'openssl'

class User < ApplicationRecord
  ITERATIONS = 20000
  DIGEST = OpenSSL::Digest::SHA256.new

  attr_accessor :password

  has_many :questions

  validates :email, :username, presence: true
  validates :email, :username, uniqueness: true

  validates :email, email: true
  validates :username, length: { maximum: 40 }
  validates :username, format: { with: /\A[[:alnum:]_]+\z/,
              message: "Only English letters, numbers and _ are allowed" }

  validates :password, presence: true, on: :create
  validates_confirmation_of :password

  before_validation :name_correction
  before_save :encrypt_password

  def name_correction
    username.downcase!
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
