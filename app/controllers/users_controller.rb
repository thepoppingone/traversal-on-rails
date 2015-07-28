class UsersController < ApplicationController
	before_action :authenticate_user!
	respond_to :html, :js

  def index
   # @users = User.all      old
 end

 def new

 end

 def show 
    @user = User.find(params[:id])
		@lists = @user.lists.order("id ASC")
  # @microposts = @user.microposts.paginate(page: params[:page])
  end 

end
