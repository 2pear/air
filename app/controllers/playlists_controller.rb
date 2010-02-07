class PlaylistsController < ApplicationController
  # GET /playlists.xml
  # GET /playlists.json
  def index
    @playlists = Playlist.all

    respond_to do |format|
      format.xml { render :xml => @playlists }
      format.json { render :json => @playlists }
    end
  end

  # GET /playlists/1.xml
  # GET /playlists/1.json
  def show
    @playlist = Playlist.find(params[:id])

    respond_to do |format|
      format.xml { render :xml => @playlist }
      format.json { render :json => @playlist }
    end
  end

  # GET /playlists/audio_files/1.xml
  # GET /playlists/audio_files/1.json
  def audio_files
    @playlist = Playlist.find(params[:id])
    @audio_files = @playlist.audio_files

    respond_to do |format|
      format.xml { render :xml => @audio_files }
      format.json { render :json => @audio_files }
    end
  end

  # POST /playlists.xml
  # POST /playlists.json
  def create
    @playlist = Playlist.new(params[:playlist])

    respond_to do |format|
      if @playlist.save
        format.xml { render :xml => @playlist, :status => :created, :location => @playlist }
        format.json { render :json => @playlist, :status => :created, :location => @playlist }
      else
        format.xml { render :xml => @playlist.errors, :status => :unprocessable_entity }
        format.json { render :json => @playlist.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /playlists/1.xml
  # PUT /playlists/1.json
  def update
    @playlist = Playlist.find(params[:id])

    respond_to do |format|
      if @playlist.update_attributes(params[:playlist])
        format.xml { head :ok }
        format.json { head :ok }
      else
        format.xml { render :xml => @playlist.errors, :status => :unprocessable_entity }
        format.json { render :json => @playlist.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /playlists/1.xml
  # DELETE /playlists/1.json
  def destroy
    @playlist = Playlist.find(params[:id])
    @playlist.destroy

    respond_to do |format|
      format.xml { head :ok }
      format.json { head :ok }
    end
  end
end
