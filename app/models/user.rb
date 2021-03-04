class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         has_many :items
         has_many :purchases
         validates :nickname, presence: true
         with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ } do
         validates :family_name, presence: true
         validates :first_name, presence: true
         end
         with_options presence: true, format: { with:  /\A[ァ-ヶー－]+\z/ } do
         validates :family_name_furi, presence: true
         validates :first_name_furi, presence: true
         end
         validates :birthday, presence: true

         validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/},length: { minimum: 6 }

end
