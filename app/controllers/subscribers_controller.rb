class SubscribersController < ApplicationController
  def create
    @subscriber = Subscriber.new(sub_params)
    @subscriber.save
    redirect_to root_path, notice: 'Thank you! We will be in touch with you.'

  end

  private
  def sub_params
    params.require(:subscriber).permit(:email)
  end

end
