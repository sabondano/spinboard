class LinksController < ApplicationController
  def index
    @links = current_user.links
    @link = Link.new
  end

  def create
    @link = current_user.links.new(link_params)

    if @link.save
      redirect_to links_path
    else
      flash.keep[:danger] = 'Please provide a title and a valid url.'
      redirect_to links_path
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    
    if @link.update(link_params)
      redirect_to links_path
    else
      flash.keep[:danger] = 'Please provide a title and a valid url.'
      redirect_to edit_link_path(@link.id)
    end
  end

  private
  
  def link_params
    params.require(:link).permit(:title, :url, :read)
  end
end
