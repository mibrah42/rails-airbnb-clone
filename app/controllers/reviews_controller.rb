class ReviewsController < ApplicationController


  def create
    @flat = Flat.find(params[:flat_id])
    @review = @flat.reviews.create(comment_params)
    redirect_to flat_path(@flat)
  end

  private
    def comment_params
      params.require(:review).permit(:reviewer, :stars, :body)
    end

end
