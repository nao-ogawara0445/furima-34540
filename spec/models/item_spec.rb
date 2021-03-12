require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    
    @item = FactoryBot.build(:item)
  end
  context '出品に成功する時' do
    it "すべて記入があれば登録できる" do
      expect(@item).to be_valid
    end
  end
  context '出品に失敗する時' do

    it '商品画像を1枚つけることが必須であること' do
      @item.image =  nil
      @item.valid?
      expect(@item.errors.full_messages).to include()
    end
    it '商品名が必須であること' do
      @item.item_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end
    it '商品の説明が必須であること' do
      @item.item_exposition = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item exposition can't be blank")
    end
    it 'カテゴリーの情報が必須であること' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it '商品の状態についての情報が必須であること' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
    end
    
    it '配送料の負担についての情報が必須であること' do
      @item.postage_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage must be other than 1")
    end
    it '発送元の地域についての情報が必須であること' do
      @item.shipping_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping must be other than 1")
    end
    it '発送までの日数についての情報が必須であること' do
      @item.day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Day must be other than 1")
    end
    it '販売価格についての情報が必須であること' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", "Price is invalid", "Price is not a number")
    end
    it '販売価格は、¥300~¥9,999,999の間のみ保存可能であること(最低¥300の間のみ保存可能)' do
      @item.price = 100
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
    it '販売価格は、¥300~¥9,999,999の間のみ保存可能であること(最大¥9,999,999の間のみ保存可能)' do
      @item.price = 1000000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
    it '販売価格は半角数字のみ保存可能であること' do
      @item.price ='３０００'
      @item.valid?
      expect(@item.errors.full_messages).to include( "Price is not a number")
    end
  end #context '出品に失敗する時'のend











end
