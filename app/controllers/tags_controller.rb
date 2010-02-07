class TagsController < ApplicationController
  # GET /tags.xml
  # GET /tags.json
  def index
    @tags = Tag.all

    respond_to do |format|
      format.xml { render :xml => @tags }
      format.json { render :json => @tags }
    end
  end

  # GET /tags/1.xml
  # GET /tags/1.json
  def show
    @tag = Tag.find(params[:id])

    respond_to do |format|
      format.xml { render :xml => @tag }
      format.json { render :json => @tag }
    end
  end

  # GET /tags/audio_files/1.xml
  # GET /tags/audio_files/1.json
  def audio_files
    @tag = Tag.find(params[:id])
    @audio_files = @tag.audio_files

    respond_to do |format|
      format.xml { render :xml => @audio_files }
      format.json { render :json => @audio_files }
    end
  end

  # GET /tags/search/:query.xml
  # GET /tags/search/:query.json
  def search
    query = params[:query].split(/[\s+]/)
    @tags = Tag.find_all_by_name(query)

    respond_to do |format|
      format.xml { render :xml => @tags }
      format.json { render :json => @tags }
    end
  end

  # POST /tags.xml
  # POST /tags.json
  def create
    @tag = Tag.new(params[:tag])

    respond_to do |format|
      if @tag.save
        format.xml { render :xml => @tag, :status => :created, :location => @tag }
        format.json { render :json => @tag, :status => :created, :location => @tag }
      else
        format.xml { render :xml => @tag.errors, :status => :unprocessable_entity }
        format.json { render :json => @tag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tags/1.xml
  # PUT /tags/1.json
  def update
    @tag = Tag.find(params[:id])

    respond_to do |format|
      if @tag.update_attributes(params[:tag])
        format.xml { head :ok }
        format.json { head :ok }
      else
        format.xml { render :xml => @tag.errors, :status => :unprocessable_entity }
        format.json { render :json => @tag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tags/1.xml
  # DELETE /tags/1.json
  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    respond_to do |format|
      format.xml { head :ok }
      format.json { head :ok }
    end
  end
end
