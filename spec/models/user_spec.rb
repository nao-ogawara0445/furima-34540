require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "すべて記入があれば登録できる" do
      expect(@user).to be_valid
    end
    
    it 'ニックネームが必須であること' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'メールアドレスが必須であること' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'メールアドレスは、@を含む必要があること' do
      @user.email = 'testexample'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it ' メールアドレスが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it "パスワードは、6文字以上での入力が必須であること" do
      @user.password = '12abc'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is too short (minimum is 6 characters)")
    end
    it 'パスワードが必須であること' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it ' パスワードは、確認用を含めて2回入力すること' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it ' パスワードとパスワード（確認用）は、値の一致が必須であること' do
      @user.password_confirmation = '456def'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'ユーザー本名は、名字と名前がそれぞれ必須であること（名字がなければ登録できない）' do
      @user.family_name = ''
     
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank", "Family name is invalid")
    end
    it 'ユーザー本名は、名字と名前がそれぞれ必須であること（名前がなければ登録できない）' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
    end
    it 'ユーザー本名のフリガナは、名字と名前がそれぞれ必須であること（名字がなければ登録できない）' do
      @user.family_name_furi  = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name furi can't be blank", "Family name furi is invalid")
    end
    it 'ユーザー本名のフリガナは、名字と名前がそれぞれ必須であること（名前がなければ登録できない）' do
      @user.first_name_furi = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name furi can't be blank", "First name furi is invalid")
    end
    it 'ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること' do
      @user.family_name_furi  = 'ﾔﾏﾀﾞ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name furi is invalid")
    end
    it 'ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること' do
      @user.first_name_furi = 'ﾀﾛｳ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name furi is invalid")
    end
    it '生年月日が必須であること' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
   
    it 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること(漢字ひらがなカタカナ以外first_nameに登録できない)' do
      @user.first_name = 'ABC'
      @user.valid?
      expect(@user.errors.full_messages).to include()
    end
    it 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること(漢字ひらがなカタカナ以外family_nameに登録できない)' do
      @user.family_name = 'DEF'
      @user.valid?
      expect(@user.errors.full_messages).to include()
    end
    it "パスワードは、半角英数字混合での入力が必須であること(数字のみのpasswordは設定できない)"do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
    end
    it "パスワードは、半角英数字混合での入力が必須であること(英語のみのpasswordは設定できない)"do
      @user.password = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
    end
    it"tokenが空だと保存できない"
    @user.token = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
    end
    
  end
end