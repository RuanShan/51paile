//J_GivePrice

$(function() {
  if($("#J_GivePrice").is("*")){

    var $input = $("#J_PriceInput");
    var user_id = 0;
    var num = $input.data("num");
    var form = $input;

    // Called when the subscription is ready for use on the server
    // Called when the subscription has been terminated by the server
    App.auctions = App.cable.subscriptions.create( { channel: "AuctionsChannel", room: num ,
      unconnected: function(){

      },
      disconnected: function(){

      },
      received: function(data) {

      }
    })
  }
});
