jQuery(document).ready(function ($) {

  // product list count down
  $(".pai-countdown").each( function(){
    var $this = $(this);
    var local_now = new Date( );
    var local_offset=local_now.getTimezoneOffset()*60000;
    var now = new Date( $this.data('now')  );
    var end = new Date( $this.data('end')  );
    var d, h, m, s;

    $this.countdown( now, end, function(event){
      var timeFormat = "%d day(s) %h小时%m分%s秒";
      var $this = $(this);
      switch(event.type) {
        case "days":
          d = event.value;
          break;
        case "hours":
          h = event.value;
          break;
        case "minutes":
          m = event.value;
          $this.find(".pai-minute em").html( s );
          break;
        case "seconds":
          s = event.value;
          $this.find(".pai-second em").html( s );
          if (parseInt(s)%2==0) //
          {
            if ( false )
            {
              //ajax_get('<%=close_auction_path(@auction)%>')
              $this.detach();
            }else{
              //ajax_get('<%=start_auction_path(@auction)%>')
            }
          }
          break;
        case "finished":
          break;
      }
    });
  });

  // product list count down
  $("#sf-countdown").each( function(){
    var $this = $(this);
    var local_now = new Date( );
    var local_offset=local_now.getTimezoneOffset()*60000;
    var now = new Date( $this.data('now'));
    var end = new Date( $this.data('end'));
    var d, h, m, s;

    $this.countdown( now, end, function(event){
      var timeFormat = "%d day(s) %h小时%m分%s秒";
      switch(event.type) {
        case "days":
          break;
        case "hours":
          break;
        case "minutes":
          break;
        case "seconds":

          $this.find(".J_TimeLeft").replaceWith(
             _.template( $("#j_datetime_left").html(), {variable: 'lasting'})(event.lasting));
          break;
        case "finished":
          //ajax_get('<%=close_auction_path(@auction)%>')
          //ajax_get('<%=start_auction_path(@auction)%>')
          break;
      }
    });
  });


});
