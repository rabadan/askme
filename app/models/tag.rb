class Tag < ApplicationRecord
  REGEX_HASH_TAG = /#[[:word:]-]+/

  has_and_belongs_to_many :questions

  validates :name, presence: true, uniqueness: true, format: { with: REGEX_HASH_TAG }

  before_validation :name_downcase

  def name_downcase
    self.name = ru_downcase(name) if name.present?
  end

  def self.remove_unlinked_tags!
    Tag.left_outer_joins(:questions).where(questions: { id: nil }).destroy_all
  end

  def self.parse_hash_tags(text)
    text.scan(REGEX_HASH_TAG)
  end

end
