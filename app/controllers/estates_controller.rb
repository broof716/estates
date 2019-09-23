class EstatesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

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

  def show
    @estate = Estate.find(params[:id])
  end

  def edit
    @estate = Estate.find(params[:id])

    if @estate.user != current_user
      return redner plain: 'Not Allowed', status: :forbidden
    end
  end

  def update
    @estate = Estate.find(params[:id])
    if @estate.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end

    @estate.update_attributes(estate_params)
    redirect_to root_path
  end

  def destroy
    @estate - Estate.find(params[:id])
    if @estate.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end
    
    @estate.destroy
    redirect_to root_path
  end

  private

  def estate_params
    params.require(:estate).permit(:name, :address)
  end

end
