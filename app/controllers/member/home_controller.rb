class Member::HomeController < ApplicationController
  def index
    if params[:tag].present?
      @tag = Tag.find(params[:tag])
      @posts = @tag.posts.includes(:tags).page(params[:page])
      .per(20).order(created_at: :desc)
      @title = "タグがついた投稿"
    else
      @posts = Post.all.includes(:user).includes(:tags)
      .page(params[:page]).per(20).order(created_at: :desc)
    end
  end
end
