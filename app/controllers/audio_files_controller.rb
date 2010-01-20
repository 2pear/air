class AudioFilesController < ApplicationController
  # GET /audio_files
  # GET /audio_files.xml
  # GET /audio_files.json
  def index
    @audio_files = AudioFile.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @audio_files }
      format.json { render :json => @audio_files }
    end
  end

  # GET /audio_files/1
  # GET /audio_files/1.xml
  # GET /audio_files/1.json
  def show
    @audio_file = AudioFile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @audio_file }
      format.json { render :json => @audio_file }
    end
  end

  # GET /audio_files/parts/1
  # GET /audio_files/parts/1.xml
  # GET /audio_files/parts/1.json
  def parts
    @audio_file = AudioFile.find(params[:id])
    @parts = @audio_file.parts

    respond_to do |format|
      format.html # parts.html.erb
      format.xml { render :xml => @parts }
      format.json { render :json => @parts }
    end
  end

  # POST /audio_files.xml
  # POST /audio_files.json
  def create
    @audio_file = AudioFile.new(params[:audio_file])

    respond_to do |format|
      if @audio_file.save
        format.xml { render :xml => @audio_file, :status => :created, :location => @audio_file }
        format.json { render :json => @audio_file, :status => :created, :location => @audio_file }
      else
        format.xml { render :xml => @audio_file.errors, :status => :unprocessable_entity }
        format.json { render :json => @audio_file.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /audio_files/1.xml
  # PUT /audio_files/1.json
  def update
    @audio_file = AudioFile.find(params[:id])

    respond_to do |format|
      if @audio_file.update_attributes(params[:audio_file])
        format.xml { head :ok }
        format.json { head :ok }
      else
        format.xml { render :xml => @audio_file.errors, :status => :unprocessable_entity }
        format.json { render :json => @audio_file.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /audio_files/1.xml
  # DELETE /audio_files/1.json
  def destroy
    @audio_file = AudioFile.find(params[:id])
    @audio_file.destroy

    respond_to do |format|
      format.xml { head :ok }
      format.json { head :ok }
    end
  end
end
