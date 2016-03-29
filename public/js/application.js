$(document).ready(function(){

  //Step 1.
  // The HREF on the a tag, has the url i want to go.
  // Get
  // []
  // html

  //Step 2.
  // A click on see-lion

  //Step 3.
  // Append it to the DOM

  $('.see-lion').on('click', function(event){
    event.preventDefault();
    var $target = $(event.target);

    var params = {
      url: $target.attr('href'),
      method: 'get',
      data: [],
      dataType: 'html'
    };

    console.log("Before Ajax");

    var xmlHttpObject = $.ajax(params);

    xmlHttpObject.done(function(response){
      $('body').append(response);
    });

    xmlHttpObject.fail(function(response){
      console.log('You Blew It!');
    })

    console.log("After Ajax");

  });

  //Building an AJAX Request
  // Ajax returns
  // .ajax vs .post .get
  // locals and partials
  // what is a json
  // return types

});

//Zacks steps to building an Ajax Request!!! :) XD

//Step 1.

/* Where we want to go? 
   .. Look at the Form you are submitting,
   or the href you want the user to click on

// How do we wanna get there?
   .. Method  <a> are Get, <form> is Post / Put / Delete

// What do we need to take with us?
  .. Form Data, URL params, Restful Params

// What are we going to get back?
  .. HTML / JSON / Text / etc.

// Step 2.
What User Interaction will trigger the request.
 This is going to be a form submit, a click event a keydown

// Step 3.
What do you want to do when the response returns?
  Append HTML to the dom, Update some attribute of a field etc.

*/



