class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new edit destroy]
  before_action :set_listing, only: %i[show edit delete]

  def index
    @listings = Listing.all
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new
  end

  def edit
  end

  def update
    if @listing.update!(listing_params)
      redirect_to @listing
    else
      render 'edit'
    end
  end

  def show
    owner = @listing.user
    @chatroom = ChatRoom.joins(:users).find_by(users: { id: [current_user.id, owner.id] }) || ChatRoom.create
  end

  def destroy
    @listing.destroy
    redirect_to :root
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:picture, :address, :location, :home_type, :price)
  end
end
