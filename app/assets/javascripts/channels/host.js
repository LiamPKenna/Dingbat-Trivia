App.host = App.cable.subscriptions.create("HostChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    if (data["selected"]) {
      // alert(data['selected'])
    } else if (data["question"]) {
      sendMainText(`Question: ${data["question"]}`);
      console.log(data["question"]);
    } else if (data["correct_answer"]){
      sendMainText(`Correct Answer: ${data["correct_answer"]}`);
      console.log(data["correct_answer"]);
    } else if (data["player"]) {
      addDashboardPlayerPortrait(new Player(
        data["player"]["id"],
        data["player"]["name"],
        0), data["player"]["count"])
    } else if (data["update_score"]) {
      updatePlayerScore(data["update_score"]["id"], data["update_score"]["score"])
    }

    // Called when there's incoming data on the websocket for this channel
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
