class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:q].present?
      cookies[:search] = JSON.generate(params[:q].permit!.to_h)
    end
      @msg = JSON.parse cookies[:search]
      @search = Item.ransack(@msg)
      @items = @search.result.page(params[:page]).per(10)
    if params[:clear]
      @
    end
  end


  def show
    @item = Item.find(params[:id])    
  end


  def confirm
   @item = Item.find(params[:item][:id])
   stock = @item.set_order(item_params[:stock])
   @item.stock = stock
   render :show if @item.invalid?
  end


  def update
    if params[:back]
      @item = Item.find(params[:id])
      @item.stock = params[:item][:stock].to_i
      render :show
    else   
      @item = Item.find(params[:id])
      stock = @item.set_order(item_params[:stock])
      @item.stock = stock
      if @item.valid?
        @item.update(stock: stock)
        buy = History.new
        buy.user_id = current_user.id
        buy.item_id = @item.id
        buy.quantity = params[:item][:stock].to_i
        buy.total_amount = @item.price * params[:item][:stock].to_i
        buy.date = Time.now
        buy.save
        redirect_to complete_items_path
        NoticeMailer.sendmail_item(@item).deliver
      else
        @item.stock = params[:item][:stock].to_i
        render :show
      end
    end
  end

  def complete
  end


  private
    def item_params
     params.require(:item).permit(:stock)
    end

end
