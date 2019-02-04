class ItemsController < ApplicationController
  before_action :authenticate_user!
  def index
    if params[:stock]
     @q = Item.all.search(params[:q])
     @items = @q.result
    else
     @items = Item.where.not(stock:  0)
     @q = @items.search(params[:q])
     @items = @q.result
    end
  end
end
