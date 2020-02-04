App.host = App.cable.subscriptions.create("HostChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
  },

  begin: function() {
    return this.perform('begin');
  }
});
