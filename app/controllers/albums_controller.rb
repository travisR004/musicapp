class AlbumsController < ApplicationController
  before_action :get_album, only: [:destroy, :show, :edit, :update]

  def index
    @albums = Album.where(band_id: params[:band_id])
  end

  def show
  end

  def new
    get_band
    @album = Album.new
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to band_albums_url
    else
      flash.now[:error] = ["Invalid Band Credentials"]
      render :new
    end
  end

  def edit
  end

  def update
    if @album.update_attributes(album_params)
      redirect_to band_albums_url
    else
      flash.now[:error] = @album.errors.full_messages
      render :edit
    end
  end

  def destroy
    @album.destroy!
    redirect_to bands_url
  end

  private

  def get_band
    @band = Band.find(params[:band_id])
  end

  def get_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:album_name, :band_id)
  end
end
