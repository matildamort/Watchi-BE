class WatchshowsController < ApplicationController
  before_action :authenticate_user
  before_action :set_watchshow, only: [:show, :update, :destroy]
  # skip_before_action :verify_authenticity_token

  # GET /watchshows
  def index
    @watchshows = Watchshow.all

    render json: @watchshows
  end

  # GET /watchshows/1
  def show
    render json: @watchshow
  end

  # POST /watchshows
  def create
    @watchshow = Watchshow.create(watchshow_params)
    if @watchshow.save
      render json: @watchshow, status: :created, location: @watchshow
    else
      render json: @watchshow.errors, status: :unprocessable_entity
    end
  end

  #puts all watchlist details in the database into an array and renders them
  def getListedShows
    list = Array.new(Watchshow.where(watchlist_id: params[:listID]))
    puts list
    result = []
    list.each do |item|
      data = Show.find(item.show_id)
      fullData = ShowSerializer.new(data).serializable_hash[:data][:attributes]
      result.push(fullData)
    end
    render json: result
  end

  # PATCH/PUT /watchshows/1
  def update
    if @watchshow.update(watchshow_params)
      render json: @watchshow
    else
      render json: @watchshow.errors, status: :unprocessable_entity
    end
  end

  # DELETE /watchshows/1 #not used in this version of the app
  def destroy
    @watchshow.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_watchshow
      @watchshow = Watchshow.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def watchshow_params
      params.permit(:show_id, :watchlist_id)
    end
end
