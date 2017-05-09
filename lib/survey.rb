class Survey < ActiveRecord::Base
  has_many(:questions)
  before_save(:uppercase_words)
end

private

  def uppercase_words
    self.survey_title=(self.survey_title.split.map(&:capitalize).join(' '))
  end
