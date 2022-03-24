class OtpMailer < ApplicationMailer
	default from: 'salonapp@gmail.com'

  def otp_email(email, otp)
    @otp = otp
    mail(to: email, subject: 'OTP for new owner registration')
  end
end
