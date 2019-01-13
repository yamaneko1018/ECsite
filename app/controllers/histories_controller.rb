class HistoriesController < ApplicationController
 before_action :authenticate_user!
  def index
   @search = History.ransack(params[:q])
   @histories = @search.result.page(params[:page]).per(10)  
 #  @histories = History.order('quantity,total_amount,date')  
end


end
