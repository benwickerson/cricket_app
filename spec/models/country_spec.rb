require 'spec_helper'

describe Country do
  
  before do 
    @country = Country.new(name: "England")
  end

  it { should respond_to(:name) }

  describe "not having a name" do
    before { @country.name = " " }
    it { should_not be_valid }
  end

end
