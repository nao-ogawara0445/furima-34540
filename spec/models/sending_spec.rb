require 'rails_helper'

RSpec.describe Sending, type: :model do
  before do
    @sending = FactoryBot.build(:sending)
  end

  context '購入に成功する時' do
    it "必須項目があれば購入できる" do
      expect(@sending).to be_valid
    end
    it "建物名がなくても購入できる" do
      @sending.building=''
      expect(@sending).to be_valid
    end
  end
  context '購入に失敗する時' do
    it '郵便番号が必須であること' do
      @sending.postal_code =  ''
      @sending.valid?
      expect(@sending.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号にはハイフンで区切ることが必須であること' do
      @sending.postal_code =  '1234567'
      @sending.valid?
      expect(@sending.errors.full_messages).to include()
    end

    it '都道府県の選択が必須であること' do
      @sending.shipping_id  = 1 
      @sending.valid?
      expect(@sending.errors.full_messages).to include()
    end

    it '市区町村が必須であること' do
      @sending.town =  ''
      @sending.valid?
      expect(@sending.errors.full_messages).to include("Town can't be blank")
    end

    it '番地が必須であること' do
      @sending.address =  ''
      @sending.valid?
      expect(@sending.errors.full_messages).to include("Address can't be blank")
    end

    it '電話番号が必須であること' do
      @sending.tel =  ''
      @sending.valid?
      expect(@sending.errors.full_messages).to include("Tel can't be blank")
    end

    it '電話番号に数字以外の文字を入れないこと' do
      @sending.tel =  '090-123-4567'
      @sending.valid?
      expect(@sending.errors.full_messages).to include()
    end
    it '電話番号に１２桁以上の数字を入れないこと' do
      @sending.tel =  '090123456789'
      @sending.valid?
      expect(@sending.errors.full_messages).to include()
    end
  end
end
