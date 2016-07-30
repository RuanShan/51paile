$(function(){
 $('#auction_starts_at').datetimepicker({
  format:'Y/m/d H:i',
  onShow:function( ct ){
   this.setOptions({
    maxDate: $('#auction_ends_at').val() ? $('#auction_ends_at').val() : false
   })
  }
  //timepicker:false
 });
 $('#auction_ends_at').datetimepicker({
  format:'Y/m/d H:i',
  onShow:function( ct ){
   this.setOptions({
    minDate: $('#auction_starts_at').val() ? $('#auction_starts_at').val() : false
   })
  }
  //timepicker:false
 });
});
