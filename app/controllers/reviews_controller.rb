class ReviewsController < ApplicationController
  def show
    @comment = Comment.new
  end
end
