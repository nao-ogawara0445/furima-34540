class Item < ApplicationRecord
  has_one_attached :image
  has_one_attached :purchase
  
  belongs_to :user
  validates :image, presence: true
  validates :item_name , presence: true
  validates :item_exposition, presence: true
  validates :category_id, presence: true
  validates :postage_id  , presence: true
  validates :status_id  , presence: true
  validates :shipping_id, presence: true
  validates :price, presence: true,format: { with:/\A[0-9]+\z/},numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :day_id, presence: true
  
  include ActiveHash::Associations
  has_many :articles
end
