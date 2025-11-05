class NewsletterMailer < ApplicationMailer
  def weekly_newsletter(subscriber)
    @subscriber = subscriber
    @gigs = Gig.order(created_at: :desc).limit(10)
    mail(to: @subscriber.email, subject: "Weekly Jobs Update")
  end
end
