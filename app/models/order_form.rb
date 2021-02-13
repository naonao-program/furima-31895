class Orderform
  include ActiveModel::ActiveModel
  attr_accessor :postal_code, :region_id, :municipality, :address,
                :building_name, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
  validates :postal_code, format: {with: /\A\d{3}[-]\d{2}\z/}
  validates :region_id
  validates :municipality
  validates :address
  validates :phone_number, format: {with: /\A\d{10,11}\z/}
  end
  
end