class Room < ApplicationRecord
  has_many :players

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

  def wait(seconds)
    i = 0
    while i < seconds
      sleep 1
      i += 1
    end
  end

  def reset_players
    self.players.each do |player|
      player.reset
    end
  end

    # VIEW UPDATES
  def push_player(this_player)
    HostChannel.broadcast_to("room_host_#{self.id}", player: {
      "id": this_player.id,
      "name": this_player.name,
      "player_color": this_player.player_color,
      "player_icon": this_player.player_icon
    }, count: self.players.length)
  end

  def updateScores
    self.players.each do |player|
      HostChannel.broadcast_to("room_host_#{self.id}", update_score: {
        "id": player.id,
        "score": player.score,
      })
    end
  end

  def check_player_answers(correct_answer)
    correct_answers = []
    self.players.each do |player|
      if player.check_answer(correct_answer) == true
        correct_answers.push(player)
      end
    end
    correct_answers
  end

  def start_game
    reset_players()
    updateScores()
    get_question_list()
    question_loop(1)
  end

  def question_loop(loop_number)
    next_question()
    ask_question()
    HostChannel.broadcast_to("room_host_#{self.id}", countdown: {loop_number: loop_number, room_id: self.id})
  end

  def end_question(loop_number)
    @question = Question.find(self.current_question)
    RoomChannel.broadcast_to(self, blank: true)
    wait(1)
    @correct = check_player_answers(@question.correct_answer)
    HostChannel.broadcast_to("room_host_#{self.id}",
      correct_answer: @question["answer_#{@question.correct_answer}"],
      correct_players: @correct.map { |c| c.id }.join(",")
    )
    wait(4)
    updateScores()
    if loop_number.to_i >= 8
      end_game()
    else
      question_loop(loop_number.to_i + 1)
    end
  end

  def get_winner
    top_score = self.players.sort { |a,b| a.score <=> b.score }[0].score
    self.players.select { |p| p.score == top_score }
  end

  def end_game
    winner = get_winner().map do |w| {
      name: w.name,
      score: w.score,
      player_color: w.player_color,
      player_icon: w.player_icon
    }
    end
    HostChannel.broadcast_to("room_host_#{self.id}", winner: winner)
  end
end
