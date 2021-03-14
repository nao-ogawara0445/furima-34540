FactoryBot.define do
  factory :sending_form do
    postal_code    {'144-0052'}
    shipping_id    {2}
    town    {'大田区'}
    address    {'１番地３０号'}
    building    {'非宮マンション'}
    tel    {'09012345678'}
    token{"tok_0000000000000000000000000000"}
    user_id  {}
    item_id {}
  end
end
