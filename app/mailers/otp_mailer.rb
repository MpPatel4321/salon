class OtpMailer < ApplicationMailer
	default from: 'salonapp@gmail.com'

  def otp_email(email, otp)
    @email = email
    @otp = otp
    # url  = root_url
    # @url = "<a href='#{url}'>#{url}</a>".html_safe
    mail(to: @email, subject: 'OTP for new owner registration')
  end
end
