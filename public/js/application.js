 $(document).ready(function(){
  
  $('.see-lion').on('click',function(event){
    event.preventDefault();
    alert('you clicked me :( ');
  });


  $('#edit-lion').on('submit',function(event){
    event.preventDefault();
    console.log('form submit')
    debugger;
  });

  $('#save').on('submit',function(event){
    event.preventDefault();
    console.log('button submit')
    debugger;
  });

  $('#save').on('click',function(event){
    console.log('button click')
  });

});

// // First comes the selector
// $('')

// //setup the event listener 
// .on


// //tell the method, on what event you want to do something.
// .on('click')

// //tell the method, what you want to do when that event happens
// .on('click', function(event){})


