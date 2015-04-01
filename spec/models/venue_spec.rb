require 'rails_helper'

RSpec.describe Venue, :type => :model do
  describe "attribute" do
    it { should respond_to(:name) }
    it { should respond_to(:description) }
    it { should respond_to(:pricing) }
    it { should respond_to(:directions) }
    it { should respond_to(:website) }
    it { should respond_to(:contact_details) }
    it { should respond_to(:size_details) }
    it { should respond_to(:photos) }
    it { should respond_to(:children_friendly) }
    it { should respond_to(:disabled_access) }
  end

  describe "associations" do
    it { should have_and_belong_to_many(:preferred_vendors).class_name('Vendor') }
    xit { should belong_to(:user) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:contact_details) }
    it { should validate_uniqueness_of(:name).case_insensitive }
  end

  it "has a valid factory" do
    expect(build(:venue)).to be_valid
  end
end
