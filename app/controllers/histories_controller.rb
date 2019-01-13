class HistoriesController < ApplicationController
 before_action :authenticate_user!
  def index
   @histories = History.where(user_id: current_user.id)
   @histories = History.page(params[:page]).per(10)  
  end
end
