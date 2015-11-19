class RecommendationsController < ApplicationController
  def new
    @link = Link.find(params[:id])
  end

  def create
    link = Link.find(params[:id])
    to_email = params[:to_email]

    unless to_email.nil?
      email_data = { to_email: params[:to_email], link: params[:link] }
      LinkRecommender.send_recommendation_email(email_data)
      flash.keep[:danger] = 'Your recommendation was sent.'
      redirect_to links_path
    else
      flash.now[:danger] = 'Please provide an email.'
      redirect_to new_recommendation_path(link.id)
    end
  end
end
