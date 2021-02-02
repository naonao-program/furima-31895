class Item < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :address

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :region_id
    validates :shipping_date_id
    validates :price, numericality: true, inclusion: { in: 300..9999999 },/\A[0-9]+\z/
    validates :user
  end
end
