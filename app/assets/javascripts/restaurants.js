// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready(function(){
  $("#restaurant_form").hide()
  $(".rating_form").hide()
  $("#add").click(function(){
    $("#restaurant_form").toggle()
  })
  $("#restaurant_form").submit(function(){
      var valuesToSubmit = $(this).serialize();
      $.ajax({
        type: "POST",
        url: "/restaurants",
        data: valuesToSubmit,
        dataType: "HTML"
      }).success(function(response){
        $(".restaurants").append(response)
      });
      return false; // prevents normal behaviour
    });
})

$(document).on("click", ".restaurant_area", function(){
  $(this).siblings(".rating_form").toggle()
})

$(document).on("submit", ".rating_form", function(){
  var valuesToSubmit = $(this).serialize();
  $.ajax({
    type: "POST",
    url: "/rating",
    data: valuesToSubmit,
    dataType: "JSON"
  }).success(function(response){
    $(`#rating_${response.id}`).text(response.rating)
  });
  return false;
})
