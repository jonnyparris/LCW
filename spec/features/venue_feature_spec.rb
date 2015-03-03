feature "Venues" do
  scenario "should be creatable" do
    visit venues_path
    click_link "Add Venue"
    fill_in "Name", with: "dummy venue"
    fill_in "Contact", with: "dummy contacts"
    click_button "Create Venue"
    expect(page).to have_content("dummy venue")
  end
end
