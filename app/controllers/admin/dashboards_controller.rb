class Admin::DashboardsController < ApplicationController
  before_action :authorize_admin
  def show
    @paper = Paper.new
  end

  def import_papers
    ImportNewPapersJob.perform_later
    flash[:notice] = "Job successfully enqueud!"
    redirect_to admin_dashboard_path
  end

  private
  def authorize_admin
    unless current_user && current_user.admin
      redirect_to root_path
    end
  end
end
