class Room < ApplicationRecord
  has_many :players

  # VIEW UPDATES
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

  # LOGIC HELPER METHODS
  def wait(seconds)
    i = 0
    while i < seconds
      sleep 1
      i += 1
    end
  end

  def ready
    self.ready_for_next = true
    self.save
  end

  def reset_players
    self.players.each do |player|
      player.reset
    end
  end

  def check_player_answers(correct_answer)
    correct_answers = []
    wrong_answers = []
    self.players.each do |player|
      if player.check_answer(correct_answer) == true
        correct_answers.push(player)
      else
        wrong_answers.push(player)
      end
    end
    [correct_answers.map { |c| c.id }, wrong_answers.map { |c| c.id }]
  end

  def next_question
    q_arr = self.questions.split(',')
    self.current_question = q_arr.shift.to_i
    self.questions = q_arr.join(',')
    self.save
  end

  def get_image_number
    n_arr = self.image_numbers.split(',')
    image_number = n_arr.shift
    self.image_numbers = n_arr.join(',')
    self.save
    image_number
  end

  def get_question_list
    self.questions = Question.random.map { |q| q["id"] }.join(',')
    self.save
  end

  def get_winner
    top_score = self.players.sort { |a,b| b.score <=> a.score }[0].score
    self.players.select { |p| p.score == top_score }
  end

  # GAME LOGIC
  def start_game
    self.ready_for_next = false
    self.save()
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
      correct_players: @correct
    )
    wait(1)
    updateScores()
    wait(4)
    if loop_number.to_i >= 8
      end_game()
    else
      question_loop(loop_number.to_i + 1)
    end
  end

  def end_game
    winner = get_winner().map do |w| {
      id: w.id,
      name: w.name,
      score: w.score,
      player_color: w.player_color,
      player_icon: w.player_icon
    }
    end
    HostChannel.broadcast_to("room_host_#{self.id}", winner: winner)
    HostChannel.broadcast_to("room_host_#{self.id}", kill: true)
    RoomChannel.broadcast_to(self, kill: true)
    self.players.each { |p| p.destroy }
    self.destroy
  end
end
