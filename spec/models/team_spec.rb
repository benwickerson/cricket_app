require 'spec_helper'

describe Team do
  
  before do
    @team = Team.new(name: "England", country_id: 1, user_id: 1)
  end

  it { should respond_to(:name) }
  it { should respond_to(:country_id) }
  it { should respond_to(:user_id) }

end
