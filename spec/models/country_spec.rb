# == Schema Information
#
# Table name: countries
#
#  id         :integer          not null, primary key
#  code       :string(255)
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

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
