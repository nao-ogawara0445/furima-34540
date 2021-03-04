class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, numericality: { other_than: 1 } 
  belongs_to :status, numericality: { other_than: 1 } 
  belongs_to :postage, numericality: { other_than: 1 } 
  belongs_to :shipping, numericality: { other_than: 1 } 
  belongs_to :day, numericality: { other_than: 1 } 
end
