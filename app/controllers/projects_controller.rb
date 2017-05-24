class ProjectsController < ApplicationController
  before_action :load_project, :only => :disabled

  def disabled
  end

  def index
    @projects = Project.where(:enabled => true)
  end

  private

  def load_project
    @project = Project.find_by!(:name => params[:id])
  end
end