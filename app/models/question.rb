class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true
  has_and_belongs_to_many :tags

  validates :text, presence: true
  validates :text, length: { maximum: 255 }

  before_validation :cleaning_attributes
  
  before_save :update_tags
  after_commit { Tag.remove_unlinked_tags! }

  def update_tags
    find_tags = Tag.parse_hash_tags(self.text.to_s + ' ' + self.answer.to_s)

    self.tags = find_tags.map {|t| ru_downcase(t)}.uniq.map do |tag_name|
      Tag.find_or_create_by(name: tag_name)
    end
  end

  private
  # Удаляем html теги, пришедшие из формы. т.к.
  def cleaning_attributes
    self.text = ActionController::Base.helpers.strip_tags(self.text) if self.text.present?
    self.answer = ActionController::Base.helpers.strip_tags(self.answer) if self.answer.present?
  end
end
