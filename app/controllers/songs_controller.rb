class SongsController < ApplicationController
  before_action :draw_song, only: [ :show, :edit, :update ]

  def index
    @songs = Song.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def new
  end

  def create
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
