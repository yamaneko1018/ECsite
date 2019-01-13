class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @search = Item.ransack(params[:q])
    @items = @search.result
    @page = Item.page(params[:page]).per(10)
  end


  def show
    @item = Item.find(params[:id])    
  end


 # def confirm
 #  logger.debug "------"
 #  @item = Item.find(params[:id])
 #  render :show if @item.invalid?
 # end


  def update 
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

  def complete
  end


  private
    def item_params
     params.require(:item).permit(:stock)
    end

end
