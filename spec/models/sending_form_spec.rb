require 'rails_helper'

RSpec.describe SendingForm, type: :model do
  before do
   
  @user =FactoryBot.create(:user)
  @item =FactoryBot.create(:item)
  @sending_form = FactoryBot.build(:sending_form,user_id: @user.id,item_id: @item.id)
  sleep 0.1
  end

  context '購入に成功する時' do
    it "必須項目があれば購入できる" do
     
      expect(@sending_form).to be_valid
    end
    it "建物名がなくても購入できる" do
      @sending_form.building=''
      expect(@sending_form).to be_valid
    end
  end
  context '購入に失敗する時' do
    it '郵便番号が必須であること' do
      @sending_form.postal_code =  ''
      @sending_form.valid?
      expect(@sending_form.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号にはハイフンで区切ることが必須であること' do
      @sending_form.postal_code =  '1234567'
      @sending_form.valid?
      expect(@sending_form.errors.full_messages).to include("Postal code is invalid")
    end

    it '都道府県の選択が必須であること' do
      @sending_form.shipping_id  = 1 
      @sending_form.valid?
      expect(@sending_form.errors.full_messages).to include("Shipping must be other than 1")
    end

    it '市区町村が必須であること' do
      @sending_form.town =  ''
      @sending_form.valid?
      expect(@sending_form.errors.full_messages).to include("Town can't be blank")
    end

    it '番地が必須であること' do
      @sending_form.address =  ''
      @sending_form.valid?
      expect(@sending_form.errors.full_messages).to include("Address can't be blank")
    end

    it '電話番号が必須であること' do
      @sending_form.tel =  ''
      @sending_form.valid?
      expect(@sending_form.errors.full_messages).to include("Tel can't be blank")
    end

    it '電話番号に数字以外の文字を入れないこと' do
      @sending_form.tel =  '090-123-4567'
      @sending_form.valid?
      expect(@sending_form.errors.full_messages).to include("Tel is invalid")
    end
    it '電話番号に１２桁以上の数字を入れないこと' do
      @sending_form.tel =  '090123456789'
      @sending_form.valid?
      expect(@sending_form.errors.full_messages).to include("Tel is too long (maximum is 11 characters)")
    end
    it 'tokenが必須であること' do
      @sending_form.token =  ''
      @sending_form.valid?
      expect(@sending_form.errors.full_messages).to include("Token can't be blank")
    end
    it 'user_idが必須であること' do
      @sending_form.user_id =  ''
      @sending_form.valid?
      expect(@sending_form.errors.full_messages).to include("User can't be blank")
    end
    it 'item_idが必須であること' do
      @sending_form.item_id =  ''
      @sending_form.valid?
      expect(@sending_form.errors.full_messages).to include("Item can't be blank")
    end
  end
end
