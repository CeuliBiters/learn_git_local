class ImagessController < ApplicationController
  def index

  end
 
  def new

  end
 
  def create
    @images = Images.new(images_params)
    if @images.save
      flash[:success] = "Image saved!"
      redirect_to imagess_path
    else
      render 'new'
    end
  end
 
  private
 
  def images_params
    params.require(:images).permit(:file, :title)
  end
end
