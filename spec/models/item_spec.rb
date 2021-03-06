require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品" do
    context '商品の出品ができるとき' do
      it '全ての項目を正しく入力したとき、出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品の出品ができないとき' do
      it 'item_nameが空だと、出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end
      it 'item_descriptionが空だと、出品できない' do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item description can't be blank"
      end
      it 'category_idが選択されていないと、出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category is not a number"
      end
      it 'category_idが1だと、出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category must be other than 1"
      end
      it 'status_idについて選択されていないと、出品できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Status is not a number"
      end
      it 'status_idが1だと、出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Status must be other than 1"
      end
      it 'delivery_idについて選択されていないと、出品できない' do
        @item.delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery is not a number"
      end
      it 'delivery_idが1だと、出品できない' do
        @item.delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery must be other than 1"
      end
      it 'area_idが選択されていないと、出品できない' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Area is not a number"
      end
      it 'area_idが1だと、出品できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Area must be other than 1"
      end
      it 'duration_idが選択されていないと、出品できない' do
        @item.duration_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Duration is not a number"
      end
      it 'duration_idが1だと、出品できない' do
        @item.duration_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Duration must be other than 1"
      end
      it 'selling_priceが入力されていないと、出品できない' do
        @item.selling_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Selling price is not a number"
      end
      it 'selling_priceは¥300以上で設定されないと、出品できない' do
        @item.selling_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Selling price must be greater than or equal to 300"
      end
      it 'selling_priceは¥9,999,999以下で設定されないと、出品できない' do
        @item.selling_price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Selling price must be less than or equal to 9999999"
      end
      it 'selling_priceは全角数字で入力されていると、出品できない' do
        @item.selling_price = '４００'
        @item.valid?
        expect(@item.errors.full_messages).to include "Selling price is not a number"
      end
      it 'selling_priceは半角英数字混合では、出品できない' do
        @item.selling_price = '500o'
        @item.valid?
        expect(@item.errors.full_messages).to include "Selling price is not a number"
      end
      it 'selling_priceは半角英字のみでは、出品できない' do
        @item.selling_price = 'IIII'
        @item.valid?
        expect(@item.errors.full_messages).to include "Selling price is not a number"
      end
      it 'ログインしているユーザーでないと、出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end
    end
  end

end
