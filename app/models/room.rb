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
    HostChannel.broadcast_to("room_host_#{self.id}", question: @question.question)
    wait(3)
    RoomChannel.broadcast_to(self, answers: {
      a1: @question.answer_1,
      a2: @question.answer_2,
      a3: @question.answer_3,
      a4: @question.answer_4
      })
    end

    def push_player(this_player)
      HostChannel.broadcast_to("room_host_#{self.id}", player: {
        "id": this_player.id,
        "name": this_player.name,
        "count": self.players.length
      })
    end

    def wait(seconds)
      i = 0
      while i < seconds
        sleep 1
        i += 1
      end
    end

    def reset_players
      self.players.each do |player|
        player.score = 0
        player.save
      end
    end

    def updateScores
      self.players.each do |player|
        HostChannel.broadcast_to("room_host_#{self.id}", update_score: {
          "id": player.id,
          "score": player.score,
        })
      end
    end

    def start_game
      reset_players
      self.get_question_list
      8.times  do
        next_question()
        @question = Question.find(self.current_question)
        ask_question()
        self.ready_for_next = false
        i = 0
        while (self.ready_for_next == false) && (i < 10)
          sleep 1
          i += 1
        end
        RoomChannel.broadcast_to(self, blank: true)
        self.ready_for_next = false
        wait(1)
        HostChannel.broadcast_to("room_host_#{self.id}", correct_answer: @question["answer_#{@question.correct_answer}"])
        wait(4)
        @correct = self.check_player_answers(@question.correct_answer)
        updateScores()
        # show correct
        # show scores
      end
      RoomChannel.broadcast_to(self, blank: true)

      # winner
    end
  end
