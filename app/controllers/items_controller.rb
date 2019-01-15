class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only:[:show,:update]

  def index
    if params[:q].present?
      cookies[:search] = JSON.generate(params[:q].permit!.to_h)
    end
    if params[:clear]
      cookies.delete :search
    end
    unless cookies[:search].nil?
      @msg = JSON.parse cookies[:search]
    end
    @search = Item.ransack(@msg)
    @items = @search.result.page(params[:page]).per(10)
  end



  def show
    @item = Item.find(params[:id])
  end


  def confirm
   @item = Item.find(params[:item][:id])
   @item.input = item_params[:input]
   stock = @item.set_order(item_params[:input])
   @item.stock = stock
   render :show if @item.invalid?
  end


  def update
    @item = Item.find(params[:id])
    if params[:back]
      @item.input = item_params[:input]
      render :show
    else   
      stock = @item.set_order(item_params[:input])
      @item.stock = stock
      if @item.valid?
        @item.update(stock: stock)
        buy = History.new
        buy.item_id = @item.id
        buy.quantity = item_params[:input]
        buy.total_amount = @item.price * item_params[:input].to_i
        buy.date = Time.now
        buy.save
        redirect_to complete_items_path
        NoticeMailer.sendmail_item(@item).deliver
      else
        @item.input = item_params[:input]
        render :show
      end
    end
  end

  def complete
  end


  private
    def item_params
     params.require(:item).permit(:input)
    end
   
   def set_item
     @item = Item.find(params[:id])
     @item.input = 1
   end
end
