class Member::EventsController < ApplicationController
  before_action :member?, except: [:index, :date]
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
    if @event.save
      flash[:notice] = 'イベントを追加しました'
      redirect_to events_index_path
    else
      flash[:alert] = 'イベントを追加できませんでした'
      render new
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:notice] = '更新しました'
      redirect_to events_index_path
    else
      flash[:alert] = '更新できませんでした'
      render new
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

  private
    def event_params
      params.require(:event).permit(:title, :date, :detail)
    end
    
end
