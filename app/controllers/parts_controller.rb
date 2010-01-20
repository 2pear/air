class PartsController < ApplicationController
  # GET /parts.xml
  # GET /parts.json
  def index
    @parts = Part.all

    respond_to do |format|
      format.xml { render :xml => @parts }
      format.json { render :json => @parts }
    end
  end

  # GET /parts/1.xml
  # GET /parts/1.json
  def show
    @part = Part.find(params[:id])

    respond_to do |format|
      format.xml { render :xml => @part }
      format.json { render :json => @part }
    end
  end

  # POST /parts.xml
  # POST /parts.json
  def create
    @part = Part.new(params[:part])

    respond_to do |format|
      if @part.save
        format.xml { render :xml => @part, :status => :created, :location => @part }
        format.json { render :json => @part, :status => :created, :location => @part }
      else
        format.xml { render :xml => @part.errors, :status => :unprocessable_entity }
        format.json { render :json => @part.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /parts/1.xml
  # PUT /parts/1.json
  def update
    @part = Part.find(params[:id])

    respond_to do |format|
      if @part.update_attributes(params[:part])
        format.xml { head :ok }
        format.json { head :ok }
      else
        format.xml { render :xml => @part.errors, :status => :unprocessable_entity }
        format.json { render :json => @part.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /parts/1.xml
  # DELETE /parts/1.json
  def destroy
    @part = Part.find(params[:id])
    @part.destroy

    respond_to do |format|
      format.xml { head :ok }
      format.json { head :ok }
    end
  end
end
