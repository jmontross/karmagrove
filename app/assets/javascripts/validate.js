// $(document).ready(function(){

//   $('#email-sign-up').click(function(event){
//     event.preventDefault();


//     $('.email').validate({
//       rules: {
//         email: {
//           required: true,
//           email: true
//         },
//       },

//       messages: {
//         name: "Please specify your name",
//         email: {
//           required: "To contact you, we need a valid email address!",
//           email: "Your email address must be in the format of name@domain.com"
//         }
//       }
//     });
//   })
// });

// $(document).ready(function() {

//       $.validator.addMethod("email_tip", function(value) {
//         return value != 'you@site.com';
//       }, "Must be different than 'you@site.com'");

//       $("#email-sign-up").validate({

//         rules: {
//           "user[email]": {
//             required: true,
//             email_tip: true,
//             email: true
//           }
//         },

//         errorPlacement: function(error, element) {
//              error.appendTo( $("label:first") );
//            },

//       });

// });

(document).ready(function() {

      $.validator.addMethod("email_tip", function(value) {
        return value != 'you@site.com';
      }, "Must be different than 'you@site.com'");

      $("#signupForm").validate({

        rules: {
          "user[email]": {
            required: true,
            email_tip: true,
            email: true
          }
        },

        errorPlacement: function(error, element) {
             error.appendTo( $("label:first") );
           },

      });

});