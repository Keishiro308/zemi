class BookmarksController < ApplicationController

  def create
    @bookmark = Bookmarking.new(
      user_id: current_user.id,
      post_id: params[:post]
    )
    @post = Post.find(params[:post])
    respond_to do |format|
      if @bookmark.save
        format.html
        format.js
      else
        format.js {render :new}
      end
    end
  end

  def destroy
    @bookmark = current_user.bookmarkings.find(params[:id])
    @post = Post.find(@bookmark.post_id)
    respond_to do |format|
      if @bookmark.destroy
        format.html
        format.js
      else
        format.js {render :new}
      end
    end
  end
    
  
end
