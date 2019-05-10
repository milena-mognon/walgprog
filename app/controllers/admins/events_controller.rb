class Admins::EventsController < Admins::BaseController
  before_action :set_resource_name, only: [:create, :update, :destroy]
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :load_cities, only: [:new, :create, :edit, :update]

  def index
    @events = Event.order(created_at: :desc)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = t('flash.actions.create.m', resource_name: @resource_name)
      redirect_to admins_events_path
    else
      flash.now[:error] = I18n.t('flash.actions.errors')
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @event.update event_params
      flash[:success] = t('flash.actions.update.m', resource_name: @resource_name)
      redirect_to admins_events_path
    else
      flash.now[:error] = I18n.t('flash.actions.errors')
      render 'edit'
    end
  end

  def destroy
    @event.destroy

    flash[:success] = t('flash.actions.destroy.m', resource_name: @resource_name)
    redirect_to admins_events_path
  end

  private

  def event_params
    params.require(:event).permit(
      :name,
      :initials,
      :color,
      :beginning_date,
      :end_date,
      :local,
      :city_id,
      :address
    )
  end

  def set_resource_name
    @resource_name = Event.model_name.human
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def load_cities
    @cities = City.all
  end
end