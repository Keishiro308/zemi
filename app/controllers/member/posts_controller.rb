class Member::PostsController < ApplicationController
  before_action :member?

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = '投稿できました'
      redirect_to member_root_path
    else
      flash.now[:alert] = '投稿できませんでした'
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = '更新しました'
      redirect_to member_root_path
    else
      flash.now[:alert] = '更新できませんでした'
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = '削除しました'
      redirect_to member_root_path
    else
      flash[:alert] = '削除できませんでした'
      redirect_to member_root_path
    end
  end

  def show
    @post = Post.find(params[:id])
  end
  

  private
    def post_params
      params.require(:post).permit(:title, :content)
    end
end
