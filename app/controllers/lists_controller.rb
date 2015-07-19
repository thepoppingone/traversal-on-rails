class ListsController < ApplicationController
  before_action :all_lists, only: [:index, :create]
    respond_to :html, :js

    def new
      @list = List.new
      @user = User.find(params[:id])
    end

    def create
      @list  = List.create(list_params)
      @lists = User.find(list_params[:user_id]).lists
    end
    
    def destroy
      @list = List.find(params[:id])
      @user_id = @list.user_id
      @list.destroy
      @lists = User.find(@user_id).lists
    end

    private

      def all_lists
        @lists = List.all
      end

      def list_params
        params.require(:list).permit(:description, :name, :user_id)
      end

end