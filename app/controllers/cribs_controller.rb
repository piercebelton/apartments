class CribsController < ApplicationController
  before_action :set_crib, only: [:show, :edit, :update, :destroy]

  # GET /cribs
  # GET /cribs.json
  def index
    @cribs = Crib.all
  end

  # GET /cribs/1
  # GET /cribs/1.json
  def show
  end

  def map_location
    @crib = Crib.find(params[:crib_id])
    @hash = Gmaps4rails.build_markers(@crib) do |crib, marker|
      marker.lat(crib.latitude)
      marker.lng(crib.longitude)
      marker.infowindow("<em>" + crib.full_address + "</em>")
    end
    render json: @hash.to_json
  end

  # GET /cribs/new
  def new
    @crib = Crib.new
  end

  # GET /cribs/1/edit
  def edit
  end

  # POST /cribs
  # POST /cribs.json
  def create
    @crib = Crib.new(crib_params)

    respond_to do |format|
      if @crib.save
        format.html { redirect_to @crib, notice: 'Crib was successfully created.' }
        format.json { render :show, status: :created, location: @crib }
      else
        format.html { render :new }
        format.json { render json: @crib.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cribs/1
  # PATCH/PUT /cribs/1.json
  def update
    respond_to do |format|
      if @crib.update(crib_params)
        format.html { redirect_to @crib, notice: 'Crib was successfully updated.' }
        format.json { render :show, status: :ok, location: @crib }
      else
        format.html { render :edit }
        format.json { render json: @crib.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cribs/1
  # DELETE /cribs/1.json
  def destroy
    @crib.destroy
    respond_to do |format|
      format.html { redirect_to cribs_url, notice: 'Crib was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crib
      @crib = Crib.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def crib_params
      params.require(:crib).permit(:street, :city, :zip, :state, :country, :name, :phone, :contact_hours)
    end
end
