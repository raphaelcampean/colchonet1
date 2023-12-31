class Rooms::ReviewsController < ApplicationController
    before_action :require_authentication
    skip_before_action :verify_authenticity_token
    
    def create
        review = room.reviews.
        find_or_initialize_by(user_id: current_user.id)
        review.update!(review_params)
        head :ok
    end
    
    def update
        create
    end
    
    private
    
    def room
        @room ||= Room.friendly.find(params[:room_id])
    end
    
    def review_params
    params.require(:review).permit(:points)
    end
end