require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    sleep 0.1
  end

  describe '商品の出品登録' do
    context '出品登録ができるとき' do
      it '全ての入力事項が、存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'カテゴリーが「---」以外であれば登録できる' do
        @item.category_id = 1
        expect(@item).to be_valid
      end
      it '商品の状態が「---」以外であれば登録できる' do
        @item.condition_id = 1
        expect(@item).to be_valid
      end
      it '配送料の負担が「---」以外であれば登録できる' do
        @item.contribution_id = 1
        expect(@item).to be_valid
      end
      it '発送元の地域が「---」以外であれば登録できる' do
        @item.prefecture_id = 1
        expect(@item).to be_valid
      end
      it '発送までの日数が「---」以外であれば登録できる' do
        @item.deliveryday_id = 1
        expect(@item).to be_valid
      end
      it '価格が半角数字でかつ300円〜9,999,999円であれば登録できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
    end

    context '出品ができないとき' do
      it 'ユーザー情報がない場合は登録できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it '１枚画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空欄だと出品できない' do
        @item.product_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it '商品の説明が空欄だと出品できない' do
        @item.product_description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Product description can't be blank")
      end
      it 'カテゴリーの情報が「---」だと出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 0')
      end
      it 'カテゴリーの情報が空欄だと出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", 'Category is not a number')
      end
      it '商品の状態の情報が「---」だと出品できない' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 0')
      end
      it '商品の状態の情報が空欄だと出品できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank", 'Condition is not a number')
      end
      it '配送料の負担の情報が「---」だと出品できない' do
        @item.contribution_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Contribution must be other than 0')
      end
      it '配送料の負担の情報が空欄だと出品できない' do
        @item.contribution_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Contribution can't be blank", 'Contribution is not a number')
      end
      it '発送元の地域の情報が「---」だと出品できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 0')
      end
      it '発送元の地域の情報が空欄だと出品できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture is not a number')
      end
      it '発送までの日数の情報が「---」だと出品できない' do
        @item.deliveryday_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Deliveryday must be other than 0')
      end
      it '発送までの日数の情報が空欄だと出品できない' do
        @item.deliveryday_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliveryday can't be blank", 'Deliveryday is not a number')
      end
      it '価格が空欄だと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is not a number')
      end
      it '価格の範囲が、300円未満だと出品できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格の範囲が、9,999,999円を超えると出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
    end
  end
end
