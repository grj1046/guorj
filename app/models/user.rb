class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword

  before_save {self.email = email.downcase }
  before_create :create_remember_token

  field :name,            type: String
  field :email,           type: String
  field :password_digest, type: String
  field :remember_token,  type: String

  index email:          1
  index remember_token: 1

  validates_presence_of :name, :email
  validates_uniqueness_of :name, :email, case_sentive: false
  validates :name, length: 0..16
  validates :password, length: 6..20
  validates :email, format: {with:/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}

  before_save { self.email = email.downcase }
  has_secure_password

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private
    def create_remember_token
      self.remember_token = User.hash(User.new_remember_token)
    end
end
