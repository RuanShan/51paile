// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require spree/frontend
//= require spree/frontend/spree_auth

//= require_tree .

jQuery(document).ready(function ($) {
    if($("#slider1_container").is("*")){
      var options = { $AutoPlay: true };
      var jssor_slider1 = new $JssorSlider$('slider1_container', options);
    }

    // handle count down
    $(".pai-countdown").each( function(){
      var $this = $(this);
      var now = new Date( $this.data('now'));
      var end = new Date( $this.data('end'));
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
});
