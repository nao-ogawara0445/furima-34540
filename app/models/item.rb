class Item < ApplicationRecord
  has_one_attached :image
  has_one_attached :purchase
  belongs_to :user
  
  validates :item_name , presence: true
  validates :item_exposition, presence: true
  validates :category_id, presence: true
  validates :postage_id  , presence: true
  validates :shipping_id, presence: true
  validates :price, presence: true
  validates :day_id, presence: true
  
  include ActiveHash::Associations
  has_many :articles
end
