class User < ActiveRecord::Base
  has_many :microposts, dependent: :destroy
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
  validates :country, presence: true

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
