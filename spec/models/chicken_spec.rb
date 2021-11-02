require 'rails_helper'

RSpec.describe Chicken, type: :model do
  it "should validate name" do
    chicken = Chicken.create(age:3, enjoys:'wants all the attention')      
    expect(chicken.errors[:name]).to_not be_empty
  end

  it "should validate age" do
    chicken = Chicken.create(name: 'Parmesan', enjoys:'wants all the attention')      
    expect(chicken.errors[:age]).to_not be_empty
  end

  it "should validate enjoys" do
    chicken = Chicken.create(name: 'Parmesan', age:10)      
    expect(chicken.errors[:enjoys]).to_not be_empty
  end

  it "should be at least 10 characters long" do
    chicken = Chicken.create(name: 'Parmesan', age:10, enjoys:'wants all')      
    expect(chicken.errors[:enjoys]).to_not be_empty
  end

end
