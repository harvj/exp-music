class ArtistsController < ApplicationController
  def index
    @artists = Artist.where("name ilike ?", "%#{params[:q]}%")
    respond_to do |format|
      format.html 
      format.json { render json: @artists.map(&:attributes) }
    end
  end

  def show
    @artist = Artist.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @artist }
    end
  end

  def new
    @artist = Artist.new
    respond_to do |format|
      format.html
      format.json { render json: @artist }
    end
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def create
    @artist = Artist.new(params[:artist])

    respond_to do |format|
      if @artist.save
        format.html { redirect_to @artist, notice: 'Artist was successfully created.' }
        format.json { render json: @artist, status: :created, location: @artist }
      else
        format.html { render action: "new" }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @artist = Artist.find(params[:id])

    respond_to do |format|
      if @artist.update_attributes(params[:artist])
        format.html { redirect_to @artist, notice: 'Artist was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy

    respond_to do |format|
      format.html { redirect_to artists_url }
      format.json { head :ok }
    end
  end
end
