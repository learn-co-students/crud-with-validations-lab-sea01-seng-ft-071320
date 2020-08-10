class SongsController < ApplicationController
  # before_action :song_being_made, only[create, new]

  def create
    @song = Song.new(song_params)
    if @song.valid? 
      @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def new
    @song = Song.new
   
  end 

  def index
    @songs = Song.all 
  end

  def show
    @song = Song.find(params[:id])
  end 

  def edit
    @song = Song.find(params[:id])
  end

  def update 
    @song = Song.find(params[:id])
    @song.update(song_params)

    if @song.valid?
      @song.save
      # redirect_to @song # go to the song's show page 
      redirect_to song_path(@song) # go to the song's show page 
    else 
      render :edit  # render the edit page again
    end
  end 

  def destroy 
    @song = Song.find(params[:id])
    @song.destroy()
    flash[:notice] = "Song deleted."
    redirect_to songs_path  # redirect to index page
  end 

  ###########
  private
  def song_being_made  # draft before_action
  end

  def song_params()
  # def song_params(*args)
    # params.require(:song).permit(*args)
    params.require(:song).permit(:title, :genre, :artist_name, :release_year, :released) 
    #as other method but update method () call
  end  

 
  
  
end # class end

