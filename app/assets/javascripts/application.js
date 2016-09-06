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
    _.templateSettings = {
      interpolate: /\{\{(.+?)\}\}/g
    };

    $(".J_AuctionTip").parent('a,span').each(function(){
      $(this).menuhover({
                        $hover: $(".J_AuctionTip",this),
                        activate: function(){ this.$hover.css( {display:"inline"}); },
                        deactivate: function(){ this.$hover.css( {display:"none"});}
                      });
    })


    if($("#slider1_container").is("*")){
      var options = { $AutoPlay: true };
      var jssor_slider1 = new $JssorSlider$('slider1_container', options);
    }

    $("#submitDeposit").click(function(){
      $.simplemodal($('#payTipModal'),
        { minHeight:240,	minWidth: 450,
          opacity:80,overlayCss: {backgroundColor:"#000"}
        });
    })

});
