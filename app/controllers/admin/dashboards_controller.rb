class Admin::DashboardsController < ApplicationController
  before_action :authorize_admin
  def show
    @paper = Paper.new
  end

  def import_papers
    @papers = ImportNewPapersService.new().call
    redirect_to admin_dashboard_path
  end

  private
  def authorize_admin
    if !current_user.admin
      redirect_to root_path
    end
  end
end
