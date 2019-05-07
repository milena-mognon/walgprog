class Admins::ContactsController < Admins::BaseController
  breadcrumb 'contacts.index', :admins_contacts_path, only: [:new, :create]

  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
    @contacts = Contact.includes(:institution)
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params_contact)
    action_success? @contact.save, :new, 'flash.actions.create.m'
  end

  def show; end

  def edit; end

  def update
    action_success? @contact.update(params_contact), :edit, 'flash.actions.update.m'
  end

  def destroy
    contact_name = @contact.name

    @contact.destroy
    flash[:success] = I18n.t('flash.actions.destroy.m', resource_name: contact_name)
    redirect_to admins_contacts_path
  end

  private

  def action_success?(action_result, redirect_to, action)
    if action_result
      flash[:success] = I18n.t(action, resource_name: t('activerecord.models.contact.one'))
      redirect_to admins_contacts_path
    else
      flash.now[:error] = I18n.t('flash.actions.errors')
      render redirect_to
    end
  end

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def params_contact
    params.require(:contact).permit(:name, :email, :phone, :institution_id)
  end
end
