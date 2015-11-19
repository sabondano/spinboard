class LinkRecommender < ApplicationMailer
  default from: 'team@spinboard.com'

  def send_recommendation_email(email_data)
    @email_data = email_data
    mail(to: @email_data[:link],
         subject: 'Link Recommendation from Spinboard')
  end
end
