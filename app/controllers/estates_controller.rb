class EstatesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @estates = Estate.all
  end

 def new
  @estate = Estate.new
 end

  def create
    current_user.esates.create(estate_params)
    redirect_to root_path
  end

  private

  def estate_params
    params.require(:estate).permit(:name, :address)
  end

end
