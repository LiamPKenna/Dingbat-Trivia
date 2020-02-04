App.room = App.cable.subscriptions.create("RoomChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    if (data['selected']) {
      alert(data['selected'])
    }
    if (data['answers']) {
      console.log(data['answers']);
    }
  },

  submit_answer: function(data) {
    return this.perform('submit_answer', data);
  },

  hook_up: function(room_id) {
    App.room.perform("start_listening", {room_id: room_id});
  },

  host: function(room_id) {
    App.room.perform("start_hosting", {room_id: room_id});
  }
});
