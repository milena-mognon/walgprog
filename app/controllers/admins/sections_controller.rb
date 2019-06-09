class Admins::SectionsController < Admins::BaseController
  before_action :set_resource_name, only: [:create, :update, :destroy]
  before_action :set_section, only: [:show, :edit, :update, :destroy]
  before_action :set_event

  add_breadcrumb I18n.t('breadcrumbs.action.index',
                        resource_name: I18n.t('activerecord.models.section.other')),
                 :admins_event_sections_path, except: :destroy

  add_breadcrumb I18n.t('breadcrumbs.action.new.m',
                        resource_name: I18n.t('activerecord.models.section.one')),
                 :new_admins_event_section_path, only: [:new, :create]

  add_breadcrumb I18n.t('breadcrumbs.action.edit',
                        resource_name: I18n.t('activerecord.models.section.one')),
                 :edit_admins_event_section_path, only: [:edit, :update]

  add_breadcrumb I18n.t('breadcrumbs.action.show',
                        resource_name: I18n.t('activerecord.models.section.one')),
                 :admins_event_section_path, only: [:show]

  def index
    @sections = @event.sections.order(index: :desc)
  end

  def new
    @section = Section.new
    max_index
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:success] = t('flash.actions.create.m', resource_name: @resource_name)
      redirect_to admins_event_sections_path
    else
      max_index
      flash.now[:error] = I18n.t('flash.actions.errors')
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @section.update section_params
      flash[:success] = t('flash.actions.update.m', resource_name: @resource_name)
      redirect_to admins_event_sections_path
    else
      flash.now[:error] = I18n.t('flash.actions.errors')
      render 'edit'
    end
  end

  def destroy
    @section.destroy

    flash[:success] = t('flash.actions.destroy.m', resource_name: @resource_name)
    redirect_to admins_event_sections_path
  end

  private

  def section_params
    params.require(:section).permit(
      :title, :status, :alternative_text,
      :icon, :index, :event_id, :content
    )
  end

  def set_resource_name
    @resource_name = Section.model_name.human
  end

  def set_section
    @section = Section.find(params[:id])
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  def max_index
    @section.index = @event.sections.count + 1 if @section.new_record?
  end
end