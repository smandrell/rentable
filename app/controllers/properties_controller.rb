class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  # GET /properties
  def index
    if params[:city].present? || params[:state].present?
      @properties = Property.where('city LIKE ? AND state LIKE ?', "%#{params[:city]}%", "%#{params[:state]}%")
    else
      @properties = Property.all
    end
  end

  # GET /properties/1
  def show
    @property = Property.find(params[:id])
    @units = @property.units
  end
  

  # GET /properties/new
  def new
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit
    @property = Property.find(params[:id])
  end
  

  # POST /properties
  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to @property, notice: 'Property was successfully created'
    else
      render :new
    end
  end

  # PATCH/PUT /properties/1
  def update
    if @property.update(property_params)
      redirect_to @property, notice: 'Property was successfully updated'
    else
      render :edit
    end
  end

  # DELETE /properties/1
  def destroy
    @property.destroy
    redirect_to properties_url, notice: 'Property was successfully removed'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def property_params
      params.require(:property).permit(:address, :city, :state)
    end
end
