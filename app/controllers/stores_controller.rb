class StoresController < ApplicationController
  before_action :authenticate_user!

  def new
    @store = Store.new
    @addresses = @store.addresses.build
  end

  def create
    @store = Store.new(store_params)
    if @store.save
      redirect_to @store
    else
      render 'new'
    end
  end


  def show
    @store = Store.find(params[:id])
  end

  private

  def store_params
    params.require(:store).permit(:name,:industry,addresses_attributes:[:street,:city,:state,:country,:zipcode]).merge(user_id:current_user.id)
  end

end
