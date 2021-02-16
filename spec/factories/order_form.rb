FactoryBot.define do
  factory :order_form do
    postal_code    {"111-1111"}
    region_id      {4}
    municipality   {"愛知県名古屋市中区正木"}
    address        {"111"}
    building_name  {"アイウビル"}
    phone_number   {"01234567890"}
    user_id        {1}
    item_id        {1}
  end
end