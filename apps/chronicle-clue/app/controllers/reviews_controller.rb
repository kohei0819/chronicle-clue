class ReviewsController < InheritedResources::Base

  private

    def review_params
      params.require(:review).permit(:user_id, :content_id, :score, :comment, :watch_date, :watch_method_id, :watch_with_id)
    end

end
