class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end
  
  def show
    @artist = Artist.find params[:id]
  end

  def new 
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      redirect_to "/artists/#{@artist.id}"
    else
      redirect_to "/artists/new"
    end    
  end

  def edit
    @artist = Artist.find params[:id]
  end

  def update
    @artist = Artist.find params[:id]

    if @artist.update(artist_params)
      redirect_to "/artists/#{@artist.id}"
    else
      redirect_to "/artists/#{@artist.id}/edit"
    end
  end

  def destroy
    @artist = Artist.find params[:id]
    @artist.destroy

    redirect_to "/artists/"
  end

  private
  def artist_params
    params.require(:artist).permit(:name, :photo_url, :nationality)
  end
end
