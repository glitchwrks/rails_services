class ProjectsController < ApplicationController
  before_action :load_project, :only => :disabled

  def disabled
  end

  def index
    @projects = Project.where(:enabled => true).order(:printable_name)
  end

  private

  def load_project
    @project = Project.find_by!(:name => params[:id])
  end
end