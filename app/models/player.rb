class Player < ApplicationRecord
  belongs_to :room, dependent: :destroy

  def select_answer(answer)
    self.current_answer = answer
    self.save
  end

  def check_answer(correct_answer)
    if self.current_answer == correct_answer.to_i
      self.score += 10
      self.current_answer = 0
      self.save
      return true
    else
      self.current_answer = 0
      self.save
      return false
    end
  end


end
