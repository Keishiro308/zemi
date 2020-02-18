class Member::EventsController < ApplicationController
  before_action :member?, only: [:new, :create, :destroy, :destroy_image ,:edit, :update]
  def index
    @events = Event.all
  end

  def date
    @event = Event.find_by(date: params[:date])
    @date = Date.parse(params[:date])
  end
  

  def new
    @event = Event.new
    @the_day = params[:date].nil? ? Date.today : Date.parse(params[:date])
  end

  def create
    @event = Event.new(event_params)
    if @event.save_with_image(params)
      flash[:notice] = 'イベントを追加しました'
      redirect_to events_index_path
    else
      flash.now[:alert] = 'イベントを追加できませんでした'
      render 'member/events/new'
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_with_image(event_params, params)
      flash[:notice] = '更新しました'
      redirect_to events_index_path
    else
      flash.now[:alert] = '更新できませんでした'
      render 'member/events/edit'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.destroy
      flash[:notice] = '削除しました'
    else
      flash[:alert] = '削除できませんでした'
    end
    redirect_to events_index_path
  end

  def destroy_image
    @event = Event.find(params[:id])
    @image = @event.images.find(params[:image_id])
    if @image.destroy
      flash.now[:notice] = '画像を削除しました'
    else
      flash.now[:alert] = '画像を削除できませんでした'
    end
    render 'member/events/edit'
  end
  

  private
  def event_params
    params.require(:event).permit(
      :title, 
      :date, 
      :detail,
      images_attributes: [:name]
    )
  end
  
end
