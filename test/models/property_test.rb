require "test_helper"

class PropertyTest < ActiveSupport::TestCase
  # Test validations
  test "should not save property without address" do
    property = Property.new(city: "Sample City", state: "Sample State")
    assert_not property.save, "Saved the property without an address"
  end

  test "should save property with all attributes" do
    property = Property.new(address: "123 Maple St", city: "Sample City", state: "Sample State")
    assert property.save, "Failed to save the property with all attributes"
  end

  # Test associations
  test "should have many units" do
    property = properties(:one)
    assert_equal 2, property.units.count, "Property does not have the expected number of units"
  end
end
