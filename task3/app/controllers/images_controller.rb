class ImagesController < ApplicationController
  def index
	@imagess = Image.all
  end
 
  def new
	@images = Image.new
  end
 
  def create
    @images = Image.new(images_params)
    if @images.save
      flash[:success] = "Image saved!"
      redirect_to imagess_path
    else
      render 'new'
    end
  end
 
  private
 
  def images_params
    params.require(:image).permit(:file, :title)
  end
end
