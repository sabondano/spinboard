class LinksController < ApplicationController
  def index
    @links = Link.all
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)

    if @link.save
      redirect_to links_path
    else
      flash.keep[:danger] = 'Please provide a title and a valid url.'
      redirect_to links_path
    end
  end

  private
  
  def link_params
    params.require(:link).permit(:title, :url)
  end
end
