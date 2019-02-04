class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
   if params[:stock] && params[:flag]
    @q = Item.all.search(params[:q])
    @items = @q.result
  elsif  params[:stock]
    @items = Item.where(flag: 0)
    @q = @items.ransack(params[:q])
    @items = @q.result
  elsif params[:flag]
    @items = Item.where.not(stock:  0)
    @q = @items.ransack(params[:q])
    @items = @q.result
  else
   @items = Item.where.not(stock:  0, flag: 1)
   @q = @items.ransack(params[:q])
   @items = @q.result
  end
end






end
