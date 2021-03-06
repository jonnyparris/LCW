FactoryGirl.define do
  factory :venue do
    sequence(:name) { |n| "NewVenue:#{n}" }
    contact_details "call me on weekdays"
    pricing 100
    size_details 100
    children_friendly false
    disabled_access false
  end
end
