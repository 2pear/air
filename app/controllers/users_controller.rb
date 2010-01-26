class UsersController < ApplicationController
  skip_filter :authenticate, :except => [:update, :destroy, :edit]

  def login
    if session[:user_id]
      flash[:warning] = "Already logged in"
      redirect_to :action => 'index' and return
    end

    if request.post?
      if session[:user_id] = User.authenticate(params[:user][:login],
                                               params[:user][:password])
        flash[:notice] = "Login successful"
        redirect_to_stored and return
      else
        flash[:error] = "Login unsuccessful"
      end
    end

    @user = User.new(params[:user])
    respond_to do |format|
      format.html # login.html.erb
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = 'Logged out'
    redirect_to :action => 'login'
  end

  # GET /users
  # GET /users.xml
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/playlists/1
  # GET /users/playlists/1.xml
  # GET /users/playlists/1.json
  def playlists
    @user = User.find(params[:id])
    @playlists = @user.playlists

    respond_to do |format|
      format.html # playlists.html.erb
      format.xml { render :xml => @playlists }
      format.json { render :json => @playlists }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new(params[:user])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    unless session[:user_id] == params[:id].to_i
      flash[:error] = "You can only edit your own account"
      redirect_to :action => "show" and return
    end

    @user = User.find(params[:id])
  end

  # def signup
  #   @user = User.new(@params[:user])
  #   if request.post?
  #     if @user.save
  #       session[:user] = User.authenticate(@user.login, @user.password)
  #       flash[:message] = "Signup successful"
  #       redirect_to :action => "index"
  #     else
  #       flash[:warning] = "Signup unsuccessful"
  #     end
  #   end
  # end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        session[:user_id] = User.authenticate(@user.login, @user.password)
        flash[:notice] = 'User was successfully created.'
        format.html { redirect_to(@user) }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    unless session[:user_id] == params[:id].to_i
      flash[:error] = "You can only edit your own account"
      redirect_to :action => "show", :id => params[:id] and return
    end

    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'User was successfully updated.'
        format.html { redirect_to(@user) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    unless session[:user_id] == params[:id].to_i
      flash[:error] = "You can only delete your own account"
      redirect_to :action => "show", :id => params[:id] and return
    end

    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end
