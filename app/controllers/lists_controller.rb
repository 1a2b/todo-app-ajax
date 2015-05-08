class ListsController < ApplicationController

  def index
    @task = Task.new
    @list = List.new

    if signed_in?
      @lists = @current_user.lists.where(user_id: current_user.id)
    end
  end

  def new
  	@list.new
  end

  def create
    @list = current_user.lists.new(user_id:  current_user.id)
    respond_to do |format|
      if @list.save
        format.html { redirect_to lists_path }
        format.js   {}
      end
    end
  end
  
  def destroy
   @list = List.find(params[:id])
   @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_path }
      format.js   {}
    end
  end


end
