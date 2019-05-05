class Admins::ResearchersController < ApplicationController
  layout 'layouts/admins/application'

  protected

  def after_update_path_for(*)
    researchers_path
  end

  before_action :find_institutions, only: [:new, :create, :edit]
  before_action :find_researcher, only: [:show, :edit, :update, :destroy]

  public

  def index
    @researchers = Researcher.all.order(:name)
  end

  def new
    @researcher = Researcher.new
  end

  def create
    @researcher = Researcher.new(researcher_params)
    if @researcher.save
      flash[:success] = t('researchers.success.new')
      redirect_to admins_researchers_path
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @researcher.update researcher_params
      flash[:success] = t('researchers.success.edit')
      redirect_to admins_researchers_path
    else
      render 'edit'
    end
  end

  def destroy
    @researcher.destroy if @researcher.present?
    flash[:success] = t('researchers.success.destroy')
    redirect_to admins_researchers_path
  end

  private

  def researcher_params
    params.require(:researcher).permit(
      :name,
      :title,
      :academic_title,
      :genre,
      :institution_affiliation,
      :image, :image_cache
    )
  end

  def find_institutions
    @institutions = Institution.all.order(:name)
  end

  def find_researcher
    @researcher = Researcher.find(params[:id])
  end
end
