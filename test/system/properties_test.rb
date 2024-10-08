require "application_system_test_case"

class PropertiesTest < ApplicationSystemTestCase
  setup do
    @property = properties(:one)
  end

  test "visiting the index" do
    visit properties_url
    assert_selector "h1", text: "Properties"
  end

  test "creating a Property" do
    visit properties_url
    click_on "New Property"

    fill_in "Address", with: "123 Maple St"
    fill_in "City", with: "Sample City"
    fill_in "State", with: "Sample State"
    click_on "Create Property"

    assert_text "Property was successfully created"
    click_on "Back"
  end

  test "updating a Property" do
    visit properties_url
    click_on "Edit", match: :first

    fill_in "Address", with: "456 Oak St"
    click_on "Update Property"

    assert_text "Property was successfully updated"
    click_on "Back"
  end

  test "removing a Property" do
    visit properties_url
    page.accept_confirm do
      click_on "Remove", match: :first
    end
    assert_text "Property was successfully removed"
  end
end
