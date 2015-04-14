require 'rails_helper'
require 'spec_helper'

RSpec.describe Level, type: :model do
  it "has a valid factory" do 
    FactoryGirl.create(:level).should be_valid 
  end
  
  it "is invalid without a name" do 
    FactoryGirl.build(:level, name: nil).should_not be_valid 
  end
  
  it "is invalid without a description" do 
    FactoryGirl.build(:level, description: nil).should_not be_valid 
  end

  it "is invalid without a pillar" do 
    FactoryGirl.build(:level, pillar: nil).should_not be_valid 
  end

  it "is invalid without a points" do 
    FactoryGirl.build(:level, points: nil).should_not be_valid 
  end

  it "does not allow two pillars with the same name" do 
    FactoryGirl.create(:level, name: "Nostalgia")
    FactoryGirl.build(:level, name: "Nostalgia").should_not be_valid 
  end

  it "does not allow two pillars with the same value" do 
    FactoryGirl.create(:level, pillar: 2)
    FactoryGirl.build(:level, pillar: 2).should_not be_valid 
  end
end
