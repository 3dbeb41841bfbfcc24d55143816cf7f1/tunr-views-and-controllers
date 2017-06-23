class SongsController < ApplicationController
  def all_songs
    @songs = Song.all
  end

  # index
  def index
    @artist = Artist.find(params[:artist_id])
  end

  # new
  def new
    @artist = Artist.find(params[:artist_id])
    @song = Song.new
  end

  # create
  def create
    @artist = Artist.find(params[:artist_id])
    @song = Song.create(song_params)

    redirect_to artist_songs_path(@artist, @song)
  end

  # show
  def show
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.find(params[:id])
  end

  # edit
  def edit
    @artist = Artist.find(params[:artist_id])
    @song = Song.find(params[:id])
  end

  # update
  def update
    @artist = Artist.find(params[:artist_id])
    @song = Song.find(params[:id])
    @song.update(song_params)

    redirect_to artist_song_path(@artist, @song)
  end

  # destroy
  def destroy
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.find(params[:id])
    @song.destroy

    redirect_to artist_songs_path(@artist)
  end

  private

  def song_params
    params.require(:song).permit(:title, :album, :preview_url, :artist_id)
  end
end
