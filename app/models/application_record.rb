class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def ru_downcase(text)
    text.mb_chars.downcase.to_s
  end
end
