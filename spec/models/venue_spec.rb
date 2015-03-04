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
  end

  xdescribe "associations" do
    it { should belong_to(:user) }
    it { should have_many(:preferred_vendors).class_name('Vendor') }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:contact_details) }
    it { should validate_uniqueness_of(:name).case_insensitive }
  end

end
