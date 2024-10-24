class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one :order
  has_one_attached :image

  # アクティブハッシュとのアソシエーション
  belongs_to :category
  belongs_to :condition
  belongs_to :contribution
  belongs_to :prefecture
  belongs_to :day

  with_options presence: true do
    validates :user_id
    validates :image
    validates :product_name 
    validates :product_description
    validates :category_id
    validates :condition_id
    validates :contribution_id
    validates :prefecture_id
    validates :day_id
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :condition_id
    validates :contribution_id
    validates :prefecture_id
    validates :day_id
  end

end
