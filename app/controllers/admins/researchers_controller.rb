class Admins::ResearchersController < ApplicationController
  layout 'layouts/admins/application'

  protected

  def after_update_path_for(*)
    researchers_path
  end

  public

  def index
    @researchers = Researcher.all.order(:name)
  end

  def new
    @researcher = Researcher.new
    @institutions = Institution.all.order(:name)
  end

  def create
    @researcher = Researcher.new(researcher_params)
    if @researcher.save
      flash[:success] = t('researchers.success.new')
      redirect_to admins_researchers_path
    else
      @institutions = Institution.all.order(:name)
      render 'new'
    end
  end

  def show
    @researcher = Researcher.find(params[:id])
  end

  def edit
    @researcher = Researcher.find(params[:id])
  end

  def update
    @researcher = Researcher.find(params[:id])
    if @researcher.update researcher_params
      flash[:success] = t('researchers.success.edit')
      redirect_to admins_researchers_path
    else
      render 'edit'
    end
  end

  def destroy
    @researcher = Researcher.find(params[:id])
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
end
