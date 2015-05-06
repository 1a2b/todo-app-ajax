class ListsController < ApplicationController

  def index
    @task = Task.new
    @list = List.new

    if signed_in?
      @user = User.find_by(id: session[:user_id])
      @lists = @user.lists.where(user_id: session[:user_id])
    end
  end

  def new
  	@list.new
  end

  def create
    @user = User.find_by(id: session[:user_id])
    @list = @user.lists.new(user_id: session[:user_id])
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
