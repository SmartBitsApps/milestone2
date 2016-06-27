class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    if user_signed_in?
      @events = Event.all.order(created_at: :desc)
    else
      @events = Event.where(visible: params[:visible] = TRUE )
    end
  end

  def show
  end

  def new
    @event = current_user.events.build
  end

  def edit
  end

  def create
    @event = current_user.events.build(event_params)
    
    if @event.save
      redirect_to @event, notice: 'Akce byla vytvořena.'
    else
      render :new
    end
  
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Akce byla upravena.'
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_url, notice: 'Akce byla smazána.'
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:user_id, :client_id, :title, :description, 
                                    :image, :start_date, :end_date, :address, :manager, :visible)
    end
end
