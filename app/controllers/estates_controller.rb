class EstatesController < ApplicationController
  
  def index
    @estates = Estate.all
  end

 def new
  @estate = Estate.new
 end

end
