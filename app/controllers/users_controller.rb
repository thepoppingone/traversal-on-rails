class UsersController < ApplicationController
	before_action :authenticate_user!

  def index
   # @users = User.all      old
 end

 def new

 end

 def show 
    @user = User.find(params[:id])
  # @microposts = @user.microposts.paginate(page: params[:page])
  end 

end
