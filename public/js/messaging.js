$(document).ready(function(){

  setInterval(shortPoll, 5000);

  $("#new-message").on("click",function(event){
    event.preventDefault();

    $.ajax({
      url: $(event.target).attr('href'),
      method: 'get',
      data: undefined,
      dataType: 'html'
    }).done(function(response) {
      $("#new-message").hide();
      $('#right-side').append(response);
    }).fail(function(error) {
      console.log('There was an issue');
    });
  });

  $("#right-side").on("submit", "#send-message", function(event){
    event.preventDefault();
    
    $.ajax({
      url: event.target.action,
      method: event.target.method,
      data: $(event.target).serialize(),
      dataType: 'json'
    }).done(function(response){
      var currentCount = $('#left-side').data().messageCount;
      var newMessages = response.message_count - currentCount;
      $("#new-count").text("There are " + newMessages + " New Messages");
    }).fail(function(error) {
      console.log('There was another issue');
    })
  });
});


var shortPoll = function(){ 

  var message_id = Math.max.apply( null, $(".message").map(function(index,item){ return $(item).data().id } ))
  $.ajax({
    url: '/messages/update',
    data: {message_id: message_id},
    dataType: 'json'
  }).done(function(messages){
    messages.forEach(function(message){
      $('#message-stream').append( messageToHtml(message)  )
    })
  });
}

var messageToHtml = function(message){
  return ["<div class='message' data-id=" + message.id + ">",
   message.message,
  " </div> " ].join('')
}