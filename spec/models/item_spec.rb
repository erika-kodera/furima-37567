require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "出品" do
    context "出品できるとき" do
      it 'ログイン状態で、商品画像があり、商品名・商品の説明が書かれており、
          カテゴリー・商品の状態・配送料の負担・発送元の地域・発送迄の日数で「--」以外を選択していて、
          販売価格が入力されていているときに出品できる' do
          expect(@item).to be_valid
          end
    end
  
    context "出品できないとき" do
      #ユーザー
      it 'ログインしていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      #画像
      it '画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      #商品名
      it '商品名がないと出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品名が40文字以上だと出品できない' do
        @item.item_name = '商品名' * 14
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name is too long (maximum is 40 characters)")
      end
      #商品の説明
      it '商品の説明がないと出品できない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it '商品の説明が1,000文字以上だと出品できない' do
        @item.info = '商品説明' * 251
        @item.valid?
        expect(@item.errors.full_messages).to include("Info is too long (maximum is 1000 characters)")
      end
      #商品の詳細
      #カテゴリー
      it 'カテゴリーがないと出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'カテゴリーが[--]だと出品できない' do
        @item.category_id = 'id:1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      #商品の状態
      it '商品の状態がないと出品できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '商品の状態が[--]だと出品できない' do
        @item.condition_id = 'id:1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      #発送について
      #配送料の負担
      it '配送料の負担がないと出品できない' do
        @item.shipping_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end
      it '配送料の負担が[--]だと出品できない' do
        @item.shipping_charge_id = 'id:1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")

      end
      #発送元の地域
      it '発送元の地域がないと出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")

      end
      it '発送元の地域が[--]だと出品できない' do
        @item.prefecture_id = 'id:1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")

      end
      #発送までの日数
      it '発送までの日数がないと出品できない' do
        @item.shipping_time_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping time can't be blank")

      end
      it '発送までの日数が[--]だと出品できない' do
        @item.shipping_time_id = 'id:1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping time can't be blank")
      end
      #販売価格
      it '販売価格が空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 半角数字で¥300〜¥9,999,999で設定してください")
      end
      it '販売価格が¥300以下だと出品できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '販売価格が¥9,999,999以上だと出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end

