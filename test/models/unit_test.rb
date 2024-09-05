require "test_helper"

class UnitTest < ActiveSupport::TestCase
  # Test validations
  test "should not save unit without bedroom count" do
    unit = Unit.new(bathroom_count: 1, square_footage: 500, rent_price: 1200, property: properties(:one))
    assert_not unit.save, "Saved the unit without a bedroom count"
  end

  test "should save unit with all attributes" do
    unit = Unit.new(bedroom_count: 2, bathroom_count: 1, square_footage: 500, rent_price: 1200, property: properties(:one))
    assert unit.save, "Failed to save the unit with all attributes"
  end
end
