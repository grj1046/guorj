class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword
  field :name, type: String
  field :email, type: String
  field :password_digest, type: String

  index email: 1

  validates_presence_of :name, :email
  validates_uniqueness_of :name, :email, case_sentive: false
  validates :name, length: 0..16
  validates :password, length: 6..20
  validates :email, format: {with:/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}

  before_save { self.email = email.downcase }
  has_secure_password
end
