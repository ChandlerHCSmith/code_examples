// $(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

//   $('#new-note').on('click', function (e) {
//     e.preventDefault();
//     $.ajax({
//       url: "/notes/new",
//       cache: false
//     })
//     .done(function( html ) {
//       $( "body" ).prepend( html );
//     });
//   });

//   $('#create-note').on('click', function (e) {
//     e.preventDefault();
//     $.ajax({
//       type: "POST",
//       data: $('#note-form').serialize(),
//       url: '/notes',
//       cache: false,
//     })
//     .done ( loadHome );
//   });

//   $('#delete-note').on('click', function (e) {
//     e.preventDefault();
//     var noteId = $('#note-form').attr('action').split('/');
//     noteId = noteId[noteId.length - 1];
//     var input = confirm('Do you really want to delete this note?');
//     if (input) {
//       console.log('got here!')
//       $.ajax({
//         type: "DELETE",
//         url: 'notes/' + noteId,
//         cache: false
//       })
//       .done( loadHome );
//     }
//   });

//   $('#edit-note').on('click', function (e) {
//     e.preventDefault();
//     var noteId = $('#note-form').attr('action').split('/');
//     noteId = noteId[noteId.length - 1];
//     $.ajax({
//       type: "PUT",
//       data: $('#note-form').serialize(),
//       url: '/notes/' + noteId,
//       cache: false
//     })
//     .done( loadHome );
//   });

//   $('.edit').on('click', function(e) {
//     e.preventDefault();
//     var noteId = this.href.split('/');
//     $.ajax({
//       url: '/notes/' + noteId[noteId.length -1],
//       cache: false
//     })
//     .done( function ( html ) {
//       $('body').prepend( html );
//     });
//   });

// });

// function loadHome() {
//   $.ajax({
//     url: '/',
//     cache: false
//   }).
//     done( function (html) {
//       $('body').html( html );
//     });
// }