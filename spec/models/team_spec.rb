require 'spec_helper'

describe Team do
  
  before do
    @team = Team.new(name: "England", country: 01)
  end

  it { should respond_to(:name) }
  it { should respond_to(:country) }

end
