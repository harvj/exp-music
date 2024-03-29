class ReleasesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @releases = Release.includes(:artists).order("release_date desc")
  end

  def show
    @release = Release.find(params[:id])
  end

  def new
    @release = Release.new
    @artist = @release.artists.build
    20.times do
      track = @release.release_tracks.build(:recording => Recording.new)
    end
  end

  def edit
    @release = Release.find(params[:id])
    @release_tracks = @release.release_tracks.order(:track_no)
    (20 - @release_tracks.length).times do
      @release_tracks << @release.release_tracks.build(:recording => Recording.new)
    end
  end

  def create
    @release = Release.new(params[:release])

    respond_to do |format|
      if @release.save
        format.html { redirect_to @release, notice: 'Release was successfully created.' }
        format.json { render json: @release, status: :created, location: @release }
      else
        format.html { render action: "new" }
        format.json { render json: @release.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @release = Release.find(params[:id])

    respond_to do |format|
      if @release.update_attributes(params[:release])
        format.html { redirect_to @release, notice: 'Release was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @release.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @release = Release.find(params[:id])
    @release.destroy

    respond_to do |format|
      format.html { redirect_to releases_url }
      format.json { head :ok }
    end
  end
end
