class Room < ApplicationRecord
  has_many :players

  def check_player_answers(correct_answer)
    correct_answers = []
    self.players.each do |player|
      if player.check_answer(correct_answer)
        correct_answers.push(player)
      end
    end
    correct_answers
  end

  def next_question
    q_arr = self.questions.split(',')
    self.current_question = q_arr.shift.to_i
    self.questions = q_arr.join(',')
    self.save
  end

  def get_question_list
    self.questions = Question.random.map { |q| q["id"] }.join(',')
    self.save
  end

  def check_if_ready
    self.ready_for_next = self.players.all? { |p| p.current_answer != 0 }
    self.save
  end

  def ask_question

  end

  def wait(seconds)
    i = 0
    while i < seconds
      sleep 1
      i += 1
      puts i
    end
  end
end
