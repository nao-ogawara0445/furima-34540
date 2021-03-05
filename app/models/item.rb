class Item < ApplicationRecord
  has_one_attached :image
  has_one_attached :purchase
  
  belongs_to :user
  with_options presence: true do
  validates :image  
  validates :item_name   
  validates :item_exposition 
  validates :price,format: { with:/\A[0-9]+\z/},numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999} 
  end
  with_options presence: true,numericality: {other_than: 1} do
  validates :category_id  
  validates :postage_id    
  validates :status_id  
  validates :shipping_id  
  validates :day_id  
  end
  include ActiveHash::Associations
  has_many :articles
end
