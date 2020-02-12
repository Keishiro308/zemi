class Member::UsersController < ApplicationController
  before_action :member?
  before_action :correct_user?, only: [:show]
  def index
    @users = User.all.page(params[:page]).per(20).order(created_at: :desc)
  end

  def show
    @user = User.includes(:like_posts).find(params[:id])
    @like_posts = @user.like_posts.page(params[:page]).per(20).order(created_at: :desc)
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

  private
    def correct_user?
      user = User.find(params[:id])
      unless user == current_user
        flash[:alert] = '権限がありません'
        redirect_to member_root_path
      end
    end
    

end
