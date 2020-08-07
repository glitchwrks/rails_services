class Api::TestfdcNotesController < Api::ApiController

  def index
    render :json => TestfdcNote.order(:number).to_a
  end

  def show
    render :json => TestfdcNote.find(params[:id])
  end

  def create
    note = TestfdcNote.new(testfdc_note_parameters)

    if note.valid?
      note.save!
      head 201
    else
      render :json => note.errors, :status => 422
    end
  end

  private

  def testfdc_note_parameters
    params.require(:testfdc_note).permit(:number, :description)
  end
end
