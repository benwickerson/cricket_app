# == Schema Information
#
# Table name: players
#
#  id            :integer          not null, primary key
#  first_name    :string(255)
#  middle_name   :string(255)
#  last_name     :string(255)
#  dob           :date
#  country_id    :integer
#  created_at    :datetime
#  updated_at    :datetime
#  specialism_id :integer
#  hand          :string(255)
#  biography     :text
#

require 'spec_helper'

describe Player do

  before do
    @player = Player.new(first_name: "Alastair", last_name: "Cook", dob: "25/12/1984", country_of_birth: 01 )
  end

  subject { @player }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:dob) }
  it { should respond_to(:country_of_birth) }

  describe "when first_name not presenet" do
    before { @player.first_name = ' ' }
    it { should_not be_valid }
  end

  describe "when last_name not present" do
    before { @player.last_name = ' ' }
    it { should_not be_valid }
  end

  describe "when their country of birth is not present" do
    before { @player.country_of_birth = ' ' }
    it { should_not be_valid }
  end


end

