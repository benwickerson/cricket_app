# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  password_digest :string(255)
#  remember_token  :string(255)
#  admin           :boolean          default(FALSE)
#  country_id      :integer
#

class User < ActiveRecord::Base
  has_many :microposts, dependent: :destroy
  has_many :teams, dependent: :destroy
  belongs_to :country
  before_save :downcase_email
  before_save :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,  presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  #validates :country_id, presence: true

  def feed
    Micropost.where("user_id = ?", id)
  end

  private

    def downcase_email
      self.email = email.downcase
    end

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

end
