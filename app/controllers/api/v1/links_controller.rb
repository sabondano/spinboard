class Api::V1::LinksController < ApplicationController
  respond_to :json

  def update
    @link = Link.find(params[:id])
    @link.update(link_params)

    render json: @link
  end

  def link_params
    params.require(:link).permit(:title, :url, :read)
  end
end
