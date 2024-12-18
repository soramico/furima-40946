class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one :order

  # アクティブハッシュとのアソシエーション
  belongs_to :category
  belongs_to :condition
  belongs_to :contribution
  belongs_to :prefecture
  belongs_to :deliveryday

  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :product_name
    validates :product_description
    validates :category_id
    validates :condition_id
    validates :contribution_id
    validates :prefecture_id
    validates :deliveryday_id
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :condition_id
    validates :contribution_id
    validates :prefecture_id
    validates :deliveryday_id
  end
end
