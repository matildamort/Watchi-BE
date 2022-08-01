class ShowsController < ApplicationController
  before_action :set_show, only: [:show, :update, :destroy]
  # before_action :is_admin, only: [:create, :update, :destroy]

  # GET /shows
  def index
    @shows = Show.all

    render json: ShowSerializer.new(@shows).serializable_hash[:data]
  end

  # GET /shows/1
  def show
    render json: ShowSerializer.new(@show).serializable_hash[:data]
  end

  # POST /shows
  def create
    @show = Show.create(show_params)
    if @show.save
      render json: @show, status: :created, location: @show
    else
      render json: @show.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shows/1
  # def update - Not being used in this release
  #   if @show.update(show_params)
  #     render json: @show
  #   else
  #     render json: @show.errors, status: :unprocessable_entity
  #   end
  # end

  # DELETE /shows/1
  def destroy
    @show.destroy
    @show.reviews.destroy_all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_show
      @show = Show.find(params[:id])
    end

    def latest_show
      @show = Show.last
      render json: PostSerializer.new(@show).serializable_hash[:data][:attributes]
    end

    # Only allow a list of trusted parameters through.
    def show_params
      params.permit(:title, :description, :crunchyroll, :netflix, :funimation, :episodes, :airdate, :enddate, :review_id, :picture, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday)
    end

 private

 #is the current user and admin allowed
 def is_admin
    if !current_user.admin
        render json: {error: "You are not authorized to perform this action"}, status: :unauthorized
    end
  end
end