class WatchlistsController < ApplicationController
  before_action :set_watchlist, only: [:show, :update, :destroy]

  # GET /watchlists
  def index
    @watchlists = Watchlist.all

    render json: @watchlists
  end

  # GET /watchlists/1
  def show
    render json: @watchlist
  end

  # POST /watchlists
  def create
    @watchlist = Watchlist.create(watchlist_params)

    if @watchlist.save
      render json: @watchlist, status: :created, location: @watchlist
    else
      render json: @watchlist.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /watchlists/1
  # not being used in this version
  # def update
  #   if @watchlist.update(watchlist_params)
  #     render json: @watchlist
  #   else
  #     render json: @watchlist.errors, status: :unprocessable_entity
  #   end
  # end

  # DELETE /watchlists/1
  # not being used in this version - should only used upon destroy of a user, should not be used in other circumstances
  # def destroy
  #   @watchlist.destroy
  # end

  #allocate a user to a watchlist
  def getListID
    @list = Watchlist.find_by_user_id(current_user.id)
    render json: @list.id
  end

  #adds a show to the list
  def add_watchshow
    @watchlist = Watchlist.find(params[:id])
    @watchshow = Watchshow.find(params[:watchshow_id])
    @watchlist.watchshows << @watchshow
    render json: @watchlist
  end

  #removes a show from the list
  def remove_watchshow
    @watchlist = Watchlist.find(params[:id])
    @watchshow = Watchshow.find(params[:watchshow_id])
    @watchlist.watchshows.delete(@watchshow)
    render json: @watchlist
  end
  


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_watchlist
      @watchlist = Watchlist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def watchlist_params
      params.permit(:user_id)
    end
end
