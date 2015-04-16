Rails.configuration.stripe = {		
  :publishable_key => 'pk_test_4X6lP1CsXRUtODK3q7NPmcr1',		
  :secret_key      => 'sk_test_4X6lIUDUc88YPQskY2yY0e8D'		
}		
		
Stripe.api_key = Rails.configuration.stripe[:secret_key]