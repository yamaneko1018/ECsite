class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
#   binding.pry 
    @q = Item.ransack(params[:q])
    @items = @q.result
  end


  def show
    @item = Item.find(params[:id])
  end

  def create
   @item = Item.new
   if @item.save
     redirect_to items_path
   else
     render 'show'
   end
  end

end
