class Item < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :address
  has_one_attached :image


  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :region_id
    validates :shipping_date_id
    validates :price, numericality: true, inclusion: { in: 300..9999999 }
    validates :user
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :region_id
    validates :shipping_date_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :region
  belongs_to_active_hash :shipping
end