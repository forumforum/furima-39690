class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one :order

  belongs_to :category
  belongs_to :prefecture
  belongs_to :status
  belongs_to :shipping_cost
  belongs_to :delivery_time

  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :status_id
    validates :shipping_cost_id
    validates :prefecture_id
    validates :delivery_time_id
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  with_options numericality: { other_than: 0, message: 'must be other than 1' } do
    validates :category_id
    validates :prefecture_id
    validates :status_id
    validates :shipping_cost_id
    validates :delivery_time_id
  end
end
