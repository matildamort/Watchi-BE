class ReviewsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]
  before_action :set_review, only: [:show, :update, :destroy]
  before_action :is_admin, only: [:destroy]

  # GET /reviews
  def index
    @reviews = Review.all

    render json: @reviews
  end

  # GET /reviews/1
  def show
    render json: @review
  end

  # POST /reviews
  def create
    @review = Review.new(review_params)

    if @review.save
      render json: @review, status: :created, location: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reviews/1 - Feature not being used in this version of the app
  def update
    if @review.update(review_params)
      render json: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reviews/1
  def destroy
    @review.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:message, :rating, :user_id, :show_id)
    end

    def is_admin
      if current_user.admin
        return true
      else
        render json: {error: "You are not authorized to perform this action"}, status: :unauthorized
      end
    end
  
end
end
