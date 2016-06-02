class ProjectsController < ApplicationController
  before_filter :load_project, :only => :disabled

  def disabled
  end

  private

  def load_project
    @project = Project.find(params[:id])
  end
end