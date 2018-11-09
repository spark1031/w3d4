# == Schema Information
#
# Table name: responses
#
#  id         :bigint(8)        not null, primary key
#  answer_id  :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Response < ApplicationRecord
  validates :answer_id, :user_id, presence: true
  
  validate :not_duplicate_response #, unless: -> { answer_choice.nil? } what is this?
  
  belongs_to :answer_choice, 
    primary_key: :id, 
    foreign_key: :answer_id, 
    class_name: "AnswerChoice"
    
  belongs_to :respondent,
    primary_key: :id, 
    foreign_key: :user_id, 
    class_name: "User"
    
  has_one :question,
    through: :answer_choice,
    source: :question
  
  def sibling_responses
    self.question.responses.where.not(id: self.id)
  end
  
  def respondent_already_answered?
    respondent_id = self.user_id 
    siblings = self.sibling_responses 
    siblings.exists?(user_id: respondent_id)
  end
  
  private
  
  def respondent_is_not_poll_author
    Poll
      .joins(:questions, :answer_choices)
      .where()
      .pluck()
    
  end
  
  def not_duplicate_response
    if respondent_already_answered?
      self.errors[:user_id] << "User already answered"
    end
    
  end
end
