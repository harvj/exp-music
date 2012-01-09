class RecordingsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @recordings = Recording.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recordings }
    end
  end

  def show
    @recording = Recording.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @recording }
    end
  end

  def new
    @recording = Recording.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @recording }
    end
  end

  def edit
    @recording = Recording.find(params[:id])
  end

  def create
    @recording = Recording.new(params[:recording])

    respond_to do |format|
      if @recording.save
        format.html { redirect_to @recording, notice: 'Recording was successfully created.' }
        format.json { render json: @recording, status: :created, location: @recording }
      else
        format.html { render action: "new" }
        format.json { render json: @recording.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @recording = Recording.find(params[:id])

    respond_to do |format|
      if @recording.update_attributes(params[:recording])
        format.html { redirect_to @recording, notice: 'Recording was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @recording.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recording = Recording.find(params[:id])
    @recording.destroy

    respond_to do |format|
      format.html { redirect_to recordings_url }
      format.json { head :ok }
    end
  end
end
