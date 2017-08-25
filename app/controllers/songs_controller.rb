class SongsController < ApplicationController
  # new
  def new
    @song = artist.songs.new
  end

  # create
  def create
    @song = artist.songs.create(song_params)
    redirect_to songs_path(@song)
  end

  #show
  def show
    @song = artist.songs.find(params[:id])
  end

  # edit
  def edit
    @song = artist.songs.find(params[:id])
  end

  # update
  def update
    @song = artist.songs.find(params[:id])
    @song.update(song_params)

    redirect_to artist_song_path(artist, @song)
  end

  # destroy
  def destroy
    @song = artist.songs.find(params[:id])
    @song.destroy

    redirect_to artist_path(artist)
  end


  def artist
    Artist.find(params[:artist_id])
  end

  private
  def song_params
    params.require(:song).permit(:title, :album, :preview_url, :artist_id)
  end

end
