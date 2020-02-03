class Player < ApplicationRecord
  belongs_to :room, dependent: :destroy

  attr_accessor :current_answer

  def check_answer(correct_answer)
    if self.current_answer == correct_answer.to_i
      self.score += 10
      self.current_answer = 0
      return true
    else
      self.current_answer = 0
      return false
    end
  end

end
