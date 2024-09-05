require "test_helper"

class UnitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @property = properties(:one)
    @unit = units(:one)
  end

  test "should get new" do
    get new_property_unit_url(@property)
    assert_response :success
  end

  test "should create unit" do
    assert_difference('Unit.count') do
      post property_units_url(@property), params: { unit: { bedroom_count: 2, bathroom_count: 1, square_footage: 500, rent_price: 1200 } }
    end

    assert_redirected_to property_unit_url(@property, Unit.last)
  end

  test "should show unit" do
    get property_unit_url(@property, @unit)
    assert_response :success
  end

  test "should get edit" do
    get edit_property_unit_url(@property, @unit)
    assert_response :success
  end

  test "should update unit" do
    patch property_unit_url(@property, @unit), params: { unit: { bedroom_count: 3, bathroom_count: 2, square_footage: 600, rent_price: 1400 } }
    assert_redirected_to property_unit_url(@property, @unit)
  end

  test "should destroy unit" do
    assert_difference('Unit.count', -1) do
      delete property_unit_url(@property, @unit)
    end

    assert_redirected_to property_units_url(@property)
  end
end
