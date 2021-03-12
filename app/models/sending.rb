class Sending < ApplicationRecord
  belongs_to :purchase
  attr_accessor :token
  with_options presence: true do
    validates :postal_code
    validates :shipping_id
    validates  :town 
    validates  :address
    validates :tel
    validates :purchase
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping
end
