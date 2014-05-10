# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  purchase.setupForm()

purchase =
  setupForm: ->
    $('.edit_purchase').submit ->
      $('input[type=submit]').attr('disabled', true)
      if $('#card_number').length
        purchase.processCard()
        false
      else
        true

  processCard: ->
    card =
      number: $('#card_number').val()
      cvc: $('#card_code').val()
      expMonth: $('#card_month').val()
      expYear: $('#card_year').val()
    Stripe.createToken(card, purchase.handleStripeResponse)

  handleStripeResponse: (status, response) ->
    if status == 200
      $('.edit_purchase').append($('<input type="hidden" name="stripeToken" />').val(response.id))
      # console.log(response);
      # console.log($('#purchase_stripe_card_token').val(response.id));

      # token = response.id
      # # function(response){
      # #   console.log('Got token ID:', response.id);
      # #   response.id
      # # };

      # StripeCheckout.open
      #   key:         $('meta[name="stripe-key"]').attr('content')
      #   address:     true
      #   amount:      5000
      #   name:        'Joes Pistachios'
      #   description: 'A bag of Pistachios'
      #   panelLabel:  'Checkout'
      #   token:       token

      $('.edit_purchase')[0].submit()
      # $form.get(0).submit();
    else
      $('#stripe_error').text(response.error.message)
      $('input[type=submit]').attr('disabled', false)