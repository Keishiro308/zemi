class Member::HomeController < ApplicationController
  def index
    if params[:tag].present?
      @tag = Tag.find(params[:tag])
      @posts = @tag.posts.includes(:tags)
      @title = "タグがついた投稿"
    else
      @posts = Post.all.includes(:user).includes(:tags)
    end
  end
end
