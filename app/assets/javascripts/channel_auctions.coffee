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

      received: (msg)->
        console.log " yes, received msg", msg
        switch msg.event
          when 'bid' then  @newBid msg.data
          when 'started' then @start msg.data
          when 'end' then @end msg.data

      start: (data) ->
        @refresh
      end: (data) ->
        @refresh
      newBid: (data )->
        $price.html( data.formatted_current_price )
        $priceInput.attr "value", data.formatted_biddable_price
        $bidPrice.attr "value", data.biddable_price
      refresh: ->
        location.reload()
