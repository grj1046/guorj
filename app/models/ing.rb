class Ing
  include Mongoid::Document
  include Mongoid::Timestamps
  WillPaginate.per_page = 20

  field :content, type: String

  belongs_to :user

  default_scope -> { desc(:created_at) }
  validates :content, presence: true, length: 1..65535
end
