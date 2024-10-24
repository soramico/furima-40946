class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  # アクティブハッシュとのアソシエーション
  belongs_to :category
  belongs_to :condition
  belongs_to :contribution
  belongs_to :prefecture
  belongs_to :day
end
