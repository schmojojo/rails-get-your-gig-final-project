class NewsletterJob < ApplicationJob
  queue_as :default

  def perform(subscriber_id)
    subscriber = Subscriber.find(subscriber_id)
    NewsletterMailer.weekly_newsletter(subscriber).deliver_now
  end
end
