class UnitsController < ApplicationController
  before_action :set_property, only: [:show, :create]
  before_action :set_unit, only: [:show, :edit, :update, :destroy]

  # GET /units -- gets all units for all properties
  # GET /properties/:property_id/units -- gets units for specific property
  def index
    if params[:property_id]
      @property = Property.find(params[:property_id])
      @units = @property.units
    else
      @units = Unit.all
    end
  end

  # GET /properties/:property_id/units/:id
  def show
    @unit = Unit.find(params[:id])
  end

  # GET /properties/:property_id/units/new
  def new
    @property = Property.find(params[:property_id])
    @unit = @property.units.build
  end

  # GET /properties/:property_id/units/:id/edit
  def edit
    @property = Property.find(params[:property_id])
    @unit = @property.units.find(params[:id])
  end
  

  # POST /properties/:property_id/units
  def create
    @unit = @property.units.build(unit_params)
    if @unit.save
      redirect_to [@property, @unit], notice: 'Unit was successfully created'
    else
      render :new
    end
  end

  # PATCH/PUT /properties/:property_id/units/1
  def update
    redirect_path = params[:redirect_to] || [@property, @unit]

    if @unit.update(unit_params)
      redirect_to redirect_path, notice: 'Unit was successfully updated'
    else
      render :edit
    end
  end

  # DELETE /properties/:property_id/units/1
  def destroy
    redirect_path = params[:redirect_to] || [@property, @unit]
    @unit.destroy
    redirect_to redirect_path, notice: 'Unit was successfully removed'
  end
  

  private

    # Set the property for which the unit belongs
    def set_property
      if params[:property_id]
        @property = Property.find(params[:property_id])
      else
        @unit.property
      end
    end

    # Set the specific unit for actions like show, edit, update, and destroy
    def set_unit
      @unit = Unit.find(params[:id])
      @property = @unit.property # This ensures @property is set from @unit
    end

    # Strong parameters to allow only trusted parameters through
    def unit_params
      params.require(:unit).permit(:bedroom_count, :bathroom_count, :square_footage, :rent_price)
    end
end
