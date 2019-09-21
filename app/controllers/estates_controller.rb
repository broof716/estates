class EstatesController < ApplicationController
  
  def index
    @estates = Estate.all
  end

 def new
  @estate = Estate.new
 end

  def create
    Estate.create(estate_params)
    redirect_to root_path
  end

  private

  def estate_params
    params.require(:estate).permit(:name, :address)
  end

end
