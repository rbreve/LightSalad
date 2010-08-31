class SaladMailer < ActionMailer::Base
  def registration_confirmation(user)
		recipients	user.email
		from				"salad@lightsalad.com"
		subject			"Welcome to Light Salad"
		body				:user	=> user
	
	end

end
