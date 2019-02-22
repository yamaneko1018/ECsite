class HistoriesController < ApplicationController
 before_action :authenticate_user!
  def index
   @search = History.ransack(params[:q])
   @search.sorts = 'date desc' if @search.sorts.empty?
   @histories = @search.result.page(params[:page]).per(10)  
 #  @histories = History.order('quantity,total_amount,date')  
end


end
