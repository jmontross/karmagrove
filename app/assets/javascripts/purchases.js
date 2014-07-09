function handleResponse(response) {
  if (response.status_code === 201) {
    var fundingInstrument = response.cards != null ? response.cards[0] : response.bank_accounts[0];
    // Call your backend
    jQuery.post("/purchases/new", {
      uri: fundingInstrument.href
    }, function(r) {
      // Check your backend response
      if (r.status === 201) {
      	alert('successfully charged card!')
        // Your successful logic here from backend ruby
      } else {
      // Your failure logic here from backend ruby
      }
    });
  } else {
    // Failed to tokenize, your error logic here
  }
}

$('#cc-submit').click(function (e) {
  e.preventDefault();

  var payload = {
    name: $('#cc-name').val(),
    number: $('#cc-number').val(),
    expiration_month: $('#cc-ex-month').val(),
    expiration_year: $('#cc-ex-year').val(),
    cvv: $('#ex-cvv').val(),
    address: {
      postal_code: $('#ex-postal-code').val()
    }
  };

  // Create credit card
  balanced.card.create(payload, handleResponse);
});