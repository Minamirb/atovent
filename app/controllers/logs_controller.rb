class LogsController < ApplicationController
  def index
    @logs = workshop.logs.order("id_str DESC").all
    @page = Page.new
    respond_to do |format|
      format.html
      format.json { render json: @logs }
    end
  end

  def show
    @log = workshop.logs.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @log }
    end
  end

  def new
    @log = workshop.logs.new

    respond_to do |format|
      format.html
      format.json { render json: @log }
    end
  end

  def edit
    @log = workshop.logs.find(params[:id])
  end

  def create
    @log = workshop.logs.new(params[:log])

    respond_to do |format|
      if @log.save
        format.html { redirect_to [@workshop, @log], notice: 'workshop.logs was successfully created.' }
        format.json { render json: @log, status: :created, location: @log }
      else
        format.html { render action: "new" }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @log = workshop.logs.find(params[:id])

    respond_to do |format|
      if @log.update_attributes(params[:log])
        format.html { redirect_to [@workshop, @log], notice: 'workshop.logs was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @log = workshop.logs.find(params[:id])
    @log.destroy

    respond_to do |format|
      format.html { redirect_to workshop_logs_url(workshop) }
      format.json { head :ok }
    end
  end

  private
  def workshop
    @workshop ||= Workshop.find(params[:workshop_id])
  end
end
