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

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, region_id: region_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, order_id: order_id)
  end
end