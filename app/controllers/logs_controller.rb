class LogsController < ApplicationController
  # GET /logs
  # GET /logs.json
  def index
    @logs = Log.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @logs }
    end
  end

  # GET /logs/1
  # GET /logs/1.json
  def show
    @log = Log.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @log }
    end
  end

  # GET /logs/new
  # GET /logs/new.json
  def new
    @log = Log.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @log }
    end
  end

  # GET /logs/1/edit
  def edit
    @log = Log.find(params[:id])
  end

  # POST /logs
  # POST /logs.json
  def create
    @log = Log.new(params[:log])

    respond_to do |format|
      if @log.save
        format.html { redirect_to @log, notice: 'Log was successfully created.' }
        format.json { render json: @log, status: :created, location: @log }
      else
        format.html { render action: "new" }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /logs/1
  # PUT /logs/1.json
  def update
    @log = Log.find(params[:id])

    respond_to do |format|
      if @log.update_attributes(params[:log])
        format.html { redirect_to @log, notice: 'Log was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logs/1
  # DELETE /logs/1.json
  def destroy
    @log = Log.find(params[:id])
    @log.destroy

    respond_to do |format|
      format.html { redirect_to logs_url }
      format.json { head :ok }
    end
  end
end
