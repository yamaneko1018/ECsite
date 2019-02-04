class ItemsController < ApplicationController
  before_action :authenticate_user!
  def index
    @items = Item.all
    @q = Item.search(params[:q])
    @items = @q.result(distinct: true)
  end
end
