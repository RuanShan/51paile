//J_GivePrice

$(function() {
  if($("#J_GivePrice").is("*")){

    var $input = $("#J_PriceInput");
    var num = $input.data("num");
    var $form = $("#J_PmForm");
    var $price = $("#J_GivePrice");
    $price.click(function(){
      $form.submit();
    })
    // Called when the subscription is ready for use on the server
    // Called when the subscription has been terminated by the server
    App.auctions = App.cable.subscriptions.create( { channel: "AuctionsChannel", room: num },
      {
        unconnected: function(){

        },
        disconnected: function(){

        },
        received: function(data) {
          console.log.debug(" yes ..");
          alert( data["current_price"] );
        }}
    )
  }
});
