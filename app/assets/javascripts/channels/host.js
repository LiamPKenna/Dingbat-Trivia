App.host = App.cable.subscriptions.create("HostChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    if (data["selected"]) {
      console.log(data['selected']);

    } else if (data["question"]) {
      // sendQuestion(data["question"]);

    } else if (data["correct_answer"]){
      // sendAnswer(`Correct Answer: ${data["correct_answer"]}`);
      console.log(data['correct_players']);
      // sendCorrectPlayers(data['correct_players']);

    } else if (data["player"]) {
      addDashboardPlayerPortrait(new Player(data["player"]), data["count"]);

    } else if (data["update_score"]) {
      updatePlayerScore(data["update_score"]["id"], data["update_score"]["score"]);

    } else if (data["countdown"]) {
      setTimeout(function () {
        App.host.perform("end_question", {
          room_id: data["countdown"]["room_id"],
          loop_number: data["countdown"]["loop_number"]
        });
      }, 10000);

    } else if (data["winner"]){
      sendWinners(data["winner"]);
      sendMainText(`Winner: ${data["question"]}`);

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
