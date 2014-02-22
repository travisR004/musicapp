class NotesController < ApplicationController
  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to song_url(@note.song)
    else
      flash[:error] = @note.errors.full_messages
      redirect_to song_url(@note.song)
    end
  end

  private
  def note_params
    params.require(:note).permit(:song_id, :user_id, :body)
  end
end
