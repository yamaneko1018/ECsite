class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @q = Item.ransack(params[:q])
    @items = @q.result
  end


  def show
    @item = Item.find(params[:id])
    @stock = Item.find(params[:id]).stock
  end


 # def confirm
 #  logger.debug "------"
 #  @item = Item.find(params[:id])
 #  render :show if @item.invalid?
 # end


  def update 
     a = item_params
     logger.debug a
#     binding.pry
     @item = Item.find(params[:id])
     stock = @item.set_order(params[:item][:stock])
     @item.update(stock: stock)
     if @item.invalid?
     render :show
     else 
      buy = History.new
      buy.user_id = current_user.id
      buy.item_id = @item.id
      buy.quantity = params[:item][:stock].to_i
      buy.total_amount = @item.price * params[:item][:stock].to_i
      buy.date = Time.now
      buy.save
      redirect_to complete_items_path
     end
  end

  def complete
  end


  private
    def item_params
     params.require(:item).permit(:stock)
    end

end
