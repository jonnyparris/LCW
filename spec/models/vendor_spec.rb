require 'rails_helper'

RSpec.describe Vendor, :type => :model do
  describe "attribute" do
    it { should respond_to(:name) }
    it { should respond_to(:description) }
    it { should respond_to(:pricing) }
    it { should respond_to(:contact_details) }
    it { should respond_to(:website) }
    it { should respond_to(:services) }
    it { should respond_to(:photos) }
  end

  describe "associations" do
    it { should have_and_belong_to_many(:preferred_venues).class_name('Venue') }
    xit { should belong_to(:user) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:contact_details) }
    it { should validate_uniqueness_of(:name).case_insensitive }
  end

end
