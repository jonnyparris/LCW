feature "Venues" do
  scenario "should be creatable only for logged in users" do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit venues_path
    click_link "Add Single Venue"
    fill_in "Name", with: "dummy venue"
    fill_in "Contact", with: "dummy contacts"
    click_button "Create Venue"
    expect(page).to have_content("dummy venue")
  end
end
