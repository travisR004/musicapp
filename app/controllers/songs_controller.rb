class SongsController < ApplicationController
  before_action :get_song, only: [:destroy, :show, :edit, :update]

  def index
    @songs = Song.where(album_id: params[:album_id])
  end

  def show
  end

  def new
    @song = Song.new
    render :new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to songs_url
    else
      flash.now[:error] = ["Invalid Song Credentials"]
      render :new
    end
  end

  def edit
    render :edit
  end

  def update
    if @song.update_attributes(song_params)
      redirect_to songs_url
    else
      flash.now[:error] = @song.errors.full_messages
    end
  end

  def destroy
    @song.destroy!
  end

  private

  def get_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :album_id, :bonus_track)
  end

end
