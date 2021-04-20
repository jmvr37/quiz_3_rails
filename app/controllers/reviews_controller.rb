class ReviewsController < ApplicationController
    before_action :authenticate_user!
    
    def create
        @idea = Idea.find params[:idea_id]
        @review = Review.new review_params
        @review.idea = @idea
        if @review.save
            redirect_to idea_path(@idea)
        else
            render "ideas/show"
        end
    end

    def destroy
        @review = Review.find params[:id]
        @review.destroy
        redirect_to idea_path(@review.idea)
    end

    private

    def review_params
        params.require(:review).permit(:body)
    end
end
