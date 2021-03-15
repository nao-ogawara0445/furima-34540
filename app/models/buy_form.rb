class BuyForm
  include ActiveModel::Model
  attr_accessor :postal_code,:shipping_id,:town,:address,:building,:tel,:user_id,:item_id,:token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :shipping_id,numericality: {other_than: 1}
    validates :town , format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }
    validates :address
    validates :tel,format: { with: /\A[0-9０-９]+\z/}, length: { maximum: 11 }
    validates :user_id
    validates :item_id
    validates :token
  end
  
  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Buy.create(postal_code: postal_code, shipping_id: shipping_id, town: town, address: address, building: building,tel: tel,purchase_id: purchase.id)
 
  end
end