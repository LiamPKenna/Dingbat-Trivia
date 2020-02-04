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
    if self.current_question == nil
      self.get_question_list
      self.next_question
    end
    @question = Question.find(self.current_question)
    RoomChannel.broadcast_to(self, answers: {
      a1: @question.answer_1,
      a2: @question.answer_2,
      a3: @question.answer_3,
      a4: @question.answer_4
    })
    HostChannel.broadcast_to("room_host_#{self.id}", question: @question.question)
  end

  def wait(seconds)
    i = 0
    while i < seconds
      sleep 1
      i += 1
      puts i
    end
  end

  def start_game
    self.get_question_list
    8.times  do
      self.next_question
      @question = Question.find(self.current_question)
      self.ask_question
      i = 0
      while !self.ready_for_next && i > 10
        sleep 1
        i += 1
      end
      # reveal
      @correct = self.check_player_answers(@question.correct_answer)
      # show correct
      # show scores
    end
    # winner
  end
end
