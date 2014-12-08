class Article
  include Mongoid::Document
  include Mongoid::Timestamps
  WillPaginate.per_page = 10

  #field :user_id, type:Mongoid::Id 
  field :title,   type: String
  field :content, type: String

  index user_id: 1

  belongs_to :user

  default_scope -> { desc(:created_at) }
  #default_scope -> { order('created_at DESC') }

  validates_presence_of :user_id, :title, :content
  validates :content, length: 0..65535
end
