require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @buyer_address = FactoryBot.build(:buyer_address, user_id: @user.id, item_id: @item.id)
      sleep 0.1
    end
    
    describe '商品購入情報の保存' do
      context '購入情報が保存できるとき' do
        it '全ての情報を正しく入力した時、保存できる' do
          expect(@buyer_address).to be_valid
        end
        it 'building_nameが空でも、保存できる' do
          @buyer_address.building_name = ''
          expect(@buyer_address).to be_valid
        end
      end

      context '購入情報が保存できないとき' do
        it 'postal_codeが空だと保存できない' do
          @buyer_address.postal_code = ''
          @buyer_address.valid?
          expect(@buyer_address.errors.full_messages).to include("Postal code can't be blank")
        end
        it 'postal_codeがハイフンなしだと保存できない' do
          @buyer_address.postal_code = '1234567'
          @buyer_address.valid?
          expect(@buyer_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
        end
        it 'area_idが選択されていないと、保存できない' do
          @buyer_address.area_id = ''
          @buyer_address.valid?
          expect(@buyer_address.errors.full_messages).to include("Area can't be blank")
        end
        it 'area_idが1だと、保存できない' do
          @buyer_address.area_id = 1
          @buyer_address.valid?
          expect(@buyer_address.errors.full_messages).to include("Area can't be blank")
        end
        it 'municipalityが空だと保存できない' do
          @buyer_address.municipality = ''
          @buyer_address.valid?
          expect(@buyer_address.errors.full_messages).to include("Municipality can't be blank")
        end
        it 'municipalityは全角文字でないと、保存できない' do
          @buyer_address.municipality = 'Tokyo'
          @buyer_address.valid?
          expect(@buyer_address.errors.full_messages).to include("Municipality is invalid. Input full-width characters.")
        end
        it 'house_numberが空だと保存できない' do
          @buyer_address.house_number = ''
          @buyer_address.valid?
          expect(@buyer_address.errors.full_messages).to include("House number can't be blank")
        end
        it 'phone_numberが空だと保存できない' do
          @buyer_address.phone_number = ''
          @buyer_address.valid?
          expect(@buyer_address.errors.full_messages).to include("Phone number can't be blank")
        end
        it 'phone_numberが全角数字だと、保存できない' do
          @buyer_address.phone_number = '０９０１２３４５６７８'
          @buyer_address.valid?
          expect(@buyer_address.errors.full_messages).to include("Phone number is invalid.")
        end
      end
    end
end
