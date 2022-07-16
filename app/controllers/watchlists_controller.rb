class WatchlistsController < ApplicationController
  # before_action :authenticate_user
  before_action :set_watchlist, only: [:show, :update, :destroy]
  before_action :is_current_user, only: [:show, :update, :remove, :add]

  # GET /watchlists
  def index 
    @watchlists = Watchlist.all
    render json: @watchlists
  end

  # GET /watchlists/1

  #only show watchlists that belong to the current user
 
  def show
    render json: @watchlist.shows.all
  end

  # POST /watchlists
  def create
    @watchlist = Watchlist.new(watchlist_params)

    if @watchlist.save
      render json: @watchlist, status: :created, location: @watchlist
    else
      render json: @watchlist.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /watchlists/1
  # def update 
  #   if @watchlist.update(watchlist_params)
  #     render json: @watchlist
  #   else
  #     render json: @watchlist.errors, status: :unprocessable_entity
  #   end
  # end


  #add additional shows to watchlist
  def add
    @watchlist = Watchlist.find(params[:id])
    @show = Show.find(params[:show_id])
    @watchlist.shows << @show
    render json: @watchlist
  end

  #Removes a show from a watchlist
  def remove
    @watchlist = Watchlist.find(params[:id])
    @show = Show.find(params[:show_id])
    @watchlist.shows.delete(@show)
    render json: @watchlist
  end


  # DELETE /watchlists/1
  def destroy
    @watchlist.destroy
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_watchlist
      @watchlist = Watchlist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def watchlist_params
      params.require(:watchlist).permit(:user_id, :show_id)
    end

    def is_current_user
      if @watchlist.user_id == current_user.id
        return true
      else
        render json: {error: "You are not authorized to perform this action"}, status: :unauthorized
      end
    end

end
