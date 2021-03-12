class Item < ApplicationRecord
  has_one_attached :image
  has_one :purchase
  belongs_to :user
  
  with_options presence: true do
  validates :image  
  validates :item_name   
  validates :item_exposition 
  validates :price,format: { with:/\A[0-9]+\z/},numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999} 
  end
  with_options presence: true,numericality: {other_than: 1} do
  validates :category_id #カテゴリー 
  validates :postage_id  #配送料
  validates :status_id  #状態
  validates :shipping_id #発送元
  validates :day_id  #配送日
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status
  belongs_to :postage
  belongs_to :category
  belongs_to :shipping
  belongs_to :day
end
