App.room = App.cable.subscriptions.create("RoomChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    alert(data['selected'])
    // Called when there's incoming data on the websocket for this channel
  },

  submit_answer: function(data) {
    return this.perform('submit_answer', data);
  }
});
