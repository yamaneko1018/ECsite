class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
#   binding.pry 
    @q = Item.ransack(params[:q])
    @items = @q.result
  end


  def show
  end
end
