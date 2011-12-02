class PagesController < ApplicationController
  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pages }
    end
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    workshop_pages = Page.find(:all, :conditions => ["workshop_id=?", params[:id]])

    respond_to do |format|
      format.html { render :show, :locals => {:workshop_pages => workshop_pages} }
      format.json { render json: workshop_pages }
    end
  end

  # GET /pages/new
  # GET /pages/new.json
  def new
    @page = Page.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @page }
    end
  end

  # GET /pages/1/edit
  def edit
    @page = Page.find(params[:id])
  end

  # POST /pages
  # POST /pages.json
  def create
    log = Log.find(params[:id])
    created = []
    get_url(log) do |url|
      obj = Uric::URI.new(url)
      page = Page.new(:title => obj.title, :host => obj.host, :url => obj.path, :type => obj.type, :log_id => log.to_param, :workshop_id => log.workshop_id)
      page.save
      created << page
    end

    respond_to do |format|
      format.html { redirect_to :action => :index}
      format.json { render json: created, status: :created, location: :pages }
    end
  end

  def get_url(log)
    urls = URI.extract(log.content)
    urls.each do |url|
      yield url
    end
  end

  # PUT /pages/1
  # PUT /pages/1.json
  def update
    @page = Page.find(params[:id])

    respond_to do |format|
      if @page.update_attributes(params[:page])
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page = Page.find(params[:id])
    @page.destroy

    respond_to do |format|
      format.html { redirect_to pages_url }
      format.json { head :ok }
    end
  end
end
