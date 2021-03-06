feature "Filter" do
  before do
    @farm = create(:venue, pricing: 100 )
    @ranch = create(:venue, pricing: 200 )
  end

  scenario "should remove items from homepage outside of scope and re-add them afterwards" do
    visit root_path
    expect(page).to have_content(@farm.name)
    expect(page).to have_content(@ranch.name)
    fill_in "max_price", with: "150"
    click_button "Filter"
    expect(page).to_not have_content(@ranch.name)
    expect(page).to have_content(@farm.name)
    fill_in "max_price", with: "250"
    click_button "Filter"
    expect(page).to have_content(@ranch.name)
    expect(page).to have_content(@farm.name)
  end
end
