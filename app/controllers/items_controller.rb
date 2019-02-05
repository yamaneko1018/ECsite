class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
#   binding.pry 
    @q = Item.ransack(params[:q])
    @items = @q.result
  end


  def show
    @item = Item.find(params[:id])
    @stock = Item.find(params[:id]).stock
  end


  def confirm
  end

  def update
     @item = Item.find(params[:id])
     @stock = @item.set_order(params[:item][:stock])
     Rails.logger.debug @stock
     if @item.update(stock: @stock)
       redirect_to items_path
     else
       render 'show'
     end
  end


  private
    def item_params
     params.require(:item).permit(:stock)
    end

end
