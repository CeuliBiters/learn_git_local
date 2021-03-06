class ImagessController < ApplicationController
  def index
	@imagesss = Image.all
  end
 
  def new
	@imagess = Image.new
  end
 
  def create
    @imagess = Image.new(images_params)
    if @imagess.save
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
