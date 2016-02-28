var update_user_form = function(new_user_form){
  $("form").remove();
  $("#user-form-container").html(new_user_form)
}

$(document).ready(function(){
  $('#nw-usr-patron').click(function(event){
    event.preventDefault();
    var request = $.ajax({
      url: '/patrons/new'
    });
    request.done(function(response){
      update_user_form(response);
    });
  });

  $('#nw-usr-artist').click(function(event){
    event.preventDefault();
    var request = $.ajax({
      url: '/artists/new'
    });
    request.done(function(response){
      update_user_form(response);
    });
  });

  $('#nw-usr-venue').click(function(event){
    event.preventDefault();
    var request = $.ajax({
      url: '/venues/new'
    });
    request.done(function(response){
      update_user_form(response);
    });
  });
});