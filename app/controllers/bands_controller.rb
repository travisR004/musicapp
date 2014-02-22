class BandsController < ApplicationController
  before_action :get_band, only: [:destroy, :show, :edit, :update]

  def index
    @bands = Band.all
  end

  def show
  end

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to bands_url
    else
      flash.now[:error] = ["Invalid Band Credentials"]
      render :new
    end
  end

  def edit
    render :edit
  end

  def update
    if @band.update_attributes(band_params)
      redirect_to bands_url
    else
      flash.now[:error] = @band.errors.full_messages
      render :edit
    end
  end

  def destroy
    @band.destroy!
  end

  private

  def get_band
    @band = Band.find(params[:id])
  end

  def band_params
    params.require(:band).permit(:name)
  end
end
