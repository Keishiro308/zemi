class Member::UsersController < ApplicationController
  before_action :member?
  def index
    @users = User.all
  end
  

  def update
    @user = User.find(params[:id])
    if @user.member
      @user.update_column(:member, false)
      flash[:notice] = '認証解除できました'
      redirect_to member_users_path
    else
      @user.update_column(:member, true)
      flash[:notice] = '認証できました'
      redirect_to member_users_path
    end
  end

end
