require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '商品購入情報に問題がない場合購入できる' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order = FactoryBot.build(:order, user_id: user.id, item_id: item.id)
    end
    context '内容に問題ない場合' do
      it 'user_id、item_id、郵便番号、都道府県、市区町村、番地、電話番号、tokenがあれば保存ができること' do
        expect(@order).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order.building_name = ''
        expect(@order).to be_valid
      end
    end

    context '内容に問題がある場合' do
      # ユーザー情報
      it 'user_idが空では保存ができないこと' do
        @order.user_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end

      # 商品情報
      it 'item_idが空では保存ができないこと' do
        @order.item_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end

      # 郵便番号
      it '郵便番号が空では保存ができないこと' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号は全角では保存ができないこと' do
        @order.postal_code = '１２３−４５６７'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code 半角数字と前3桁、'-'、後4桁を使用してください")
      end
      it "郵便番号に'-'がないと保存ができないこと" do
        @order.postal_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code 半角数字と前3桁、'-'、後4桁を使用してください")
      end
      it "郵便番号は3桁'-'4桁でないと保存ができないこと" do
        @order.postal_code = '1234-567'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code 半角数字と前3桁、'-'、後4桁を使用してください")
      end

      # 都道府県
      it '都道府県が選択されていないと保存ができないこと' do
        @order.prefecture_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県が[--]だと保存ができないこと' do
        @order.prefecture_id = 'id:1'
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end

      # 市区町村
      it '市区町村が空では保存ができないこと' do
        @order.municipalities = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipalities can't be blank")
      end

      # 番地
      it '番地が空では保存ができないこと' do
        @order.house_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("House number can't be blank")
      end

      # 電話番号
      it '電話番号が空では保存ができないこと' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は全角では保存ができないこと' do
        @order.phone_number = '０９０１２３４５６７８'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number 半角数字、10桁もしくは11桁を使用してください')
      end
      it '電話番号は9桁以下では保存ができないこと' do
        @order.phone_number = '090123456'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number 半角数字、10桁もしくは11桁を使用してください')
      end
      it '電話番号は12桁以上では保存ができないこと' do
        @order.phone_number = '090123456789'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number 半角数字、10桁もしくは11桁を使用してください')
      end

      # token
      it 'tokenが空では登録できないこと' do
        @order.token = ''
        
        binding.pry
        
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
