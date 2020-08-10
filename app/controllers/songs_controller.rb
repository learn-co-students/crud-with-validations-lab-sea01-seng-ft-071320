class SongsController < ApplicationController
  before_action :draw_song, only: [ :show, :edit, :update, :destroy ]

  def index
    @songs = Song.all
  end

  def show
  end

  def edit
  end

  def update
    if @song.update(song_params(song_attrs))
      redirect_to @song
    else
      render :edit
    end
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params(song_attrs))

    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def destroy
    @song.destroy
    redirect_to songs_path
  end


  private

  def draw_song
    @song = Song.find(params[:id])
  end

  def song_params(*args)
    params.require(:song).permit(*args)
  end

  def song_attrs
    [ :title, :genre, :artist_name, :released, :release_year ]
  end
end
