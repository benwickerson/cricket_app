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

class Player < ActiveRecord::Base
  belongs_to :country
  belongs_to :specialism
  has_many :team_memberships
  has_many :teams, through: :team_memberships

  validates :first_name,     presence: true, length: { maximum: 50 }
  validates :last_name,      presence: true, length: { maximum: 50 }
  validates :dob,            presence: true
  validates :country_id,     presence: true
  validates :specialism_id,  presence: true
  validates :hand,           presence: true
# validates :biography,      presence: true

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |player|
        csv << player.attributes.values_at(*column_names)
      end
    end
  end

  def age
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end

  def full_name
    [first_name, last_name].join(" ")
  end


end
