require "application_system_test_case"

class UnitsTest < ApplicationSystemTestCase
  setup do
    @property = properties(:one)
    @unit = units(:one)
  end

  test "visiting the index" do
    visit property_units_url(@property)
    assert_selector "h1", text: "Units"
  end

  test "creating a Unit" do
    visit new_property_unit_url(@property)

    fill_in "Bedroom count", with: 3
    fill_in "Bathroom count", with: 2
    fill_in "Square footage", with: 600
    fill_in "Rent price", with: 1400
    click_on "Create Unit"

    assert_text "Unit was successfully created"
    click_on "Back"
  end

  test "updating a Unit" do
    visit edit_property_unit_url(@property, @unit)

    fill_in "Bedroom count", with: 4
    click_on "Update Unit"

    assert_text "Unit was successfully updated"
  end

  test "removing a Unit" do
    visit property_url(@property)
    page.accept_confirm do
      click_on "Remove", match: :first
    end
    assert_text "Unit was successfully removed"
  end
end
