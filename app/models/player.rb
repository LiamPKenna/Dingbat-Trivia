class Player < ApplicationRecord
  belongs_to :room, dependent: :destroy

  def select_answer(answer)
    self.current_answer = answer
    self.save
  end

  def reset
    self.score = 0
    self.save
  end

  def check_answer(correct_answer)
    if self.current_answer.to_i == correct_answer.to_i
      self.score += 10
      self.save
      self.current_answer = 0
      return true
    else
      self.current_answer = 0
      self.save
      return false
    end
  end


end
