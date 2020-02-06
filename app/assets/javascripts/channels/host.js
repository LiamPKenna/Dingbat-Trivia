App.host = App.cable.subscriptions.create("HostChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    if (data["selected"]) {
      playerSubmitted(data["selected"]);
    } else if (data["question"]) {
      sendQuestion(data["question"]);

    } else if (data["correct_answer"]){
      sendAnswer(data["correct_answer"], data['correct_players']);

    } else if (data["player"]) {
      addDashboardPlayerPortrait(new Player(data["player"]), data["count"]);

    } else if (data["update_score"]) {
      updatePlayerScore(data["update_score"]["id"], data["update_score"]["score"]);

    } else if (data["countdown"]) {
      questionCountdown(8);
      setTimeout(function () {
        App.host.perform("end_question", {
          room_id: data["countdown"]["room_id"],
          loop_number: data["countdown"]["loop_number"]
        });
      }, 8000);
    } else if (data["winner"]){
      sendWinners(data["winner"]);
    }
  },

  begin: function() {
    return this.perform('begin');
  },

  host: function(room_id) {
    App.host.perform("start_hosting", {room_id: room_id});
  },

  ask: function(room_id) {
    App.host.perform("ask_question", {room_id: room_id});
  }
});

const questionCountdown = (count) => {
  dashboardTimer(count);
  setTimeout(function () {
    if (count > 0) {
      return questionCountdown(count - 1)
    }
  }, 1000);
}
