class PastesController < ApplicationController
  before_action :load_paste, :only => :show

  def show
    render :plain => @paste.content
  end

  private

  def load_paste
    @paste = Paste.find_by!(:name => params[:id])
  end
end