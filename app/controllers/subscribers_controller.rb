class SubscribersController < ApplicationController
  skip_before_action :authenticate_user!
  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped

  def create
    @subscriber = Subscriber.new(subscriber_params)
    Rails.logger.info "SUBSCRIBER PARAMS: #{subscriber_params.inspect}"

    if @subscriber.save
      NewsletterJob.perform_later(@subscriber.id)  # enqueue background job
      redirect_to root_path, notice: "Thanks for subscribing!"
    else
      Rails.logger.info "ERRORS: #{@subscriber.errors.full_messages}"
      redirect_to root_path, alert: "Please fill all required fields."
    end
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:first_name, :last_name, :email)
  end
end
