class Buy < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :images , as: :imageable
  has_many :loans

end
