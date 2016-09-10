# https://css-tricks.com/jquery-coffeescript/
$ ->
  if $("#J_GivePrice").is("*")
    $priceInput = $("#J_PriceInput")

    num = $priceInput.data("num")
    $price = $(".J_Price em")
    $form = $("#J_PmForm")
    $bidButton = $("#J_GivePrice")
    $bidPrice= $("#J_RealPrice")
    $bidButton.click ->
      $form.submit();

    # Called when the subscription is ready for use on the server
    # Called when the subscription has been terminated by the server
    App.auctions = App.cable.subscriptions.create  channel: "AuctionsChannel", room: num ,
      connected: ->
        console.log "yes, it is connected"
      unconnected: ->
        console.log "yes, it is unconnected"
      disconnected: ->

      received: (data)->
        console.log " yes, received data", data
        @bidSuccess data
      bid: (price) ->
        @perform 'bid', price: price

      bidSuccess: (data )->
        $price.html( data.formatted_current_price )
        $priceInput.attr "value", data.formatted_biddable_price
        $bidPrice.attr "value", data.biddable_price
