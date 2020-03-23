require 'rails_helper'

describe Item do
  describe '#create' do
    it "全て揃っている時保存できる" do
        item = build(:item)
        expect(item).to be_valid
    end
    
    it "is invalid without a name" do
        item = build(:item, name: "")
        item.valid?
        expect(item.errors[:name]).to include("を入力してください")
    end

    it "is invalid without a description" do
        item = build(:item, description: "")
        item.valid?
        expect(item.errors[:description]).to include("を入力してください")
    end

    it "is invalid without a category_id" do
        item = build(:item, category_id: "")
        item.valid?
        expect(item.errors[:category_id]).to include("を入力してください")
    end

    it "is invalid without a status" do
        item = build(:item, status: "")
        item.valid?
        expect(item.errors[:status]).to include("を入力してください")
    end

    it "is invalid without a postage_id" do
        item = build(:item, postage_id: "")
        item.valid?
        expect(item.errors[:postage_id]).to include("を入力してください")
    end

    it "is invalid without a postage_id" do
        item = build(:item, postage_id: "")
        item.valid?
        expect(item.errors[:postage_id]).to include("を入力してください")
    end

    it "is invalid without a day_id" do
        item = build(:item, day_id: "")
        item.valid?
        expect(item.errors[:day_id]).to include("を入力してください")
    end

    #nameの文字が40文字以上と以下の場合
    it "is invalid name is too long maximum 40 characters" do
        item = build(:item, name: "a" * 41)
        item.valid?
        expect(item.errors[:name]).to include("は40文字以内で入力してください")
    end

    it "is valid with a name that has less than 40 characters" do
        item = build(:item, name: "a" * 39)
        expect(item).to be_valid
    end

    it "is invalid description is too long maximum 40 characters" do
        item = build(:item, description: "a" * 1001)
        item.valid?
        expect(item.errors[:description]).to include("は1000文字以内で入力してください")
    end

    it "is valid with a description that has less than 1000 characters" do
        item = build(:item, description: "a" * 1000)
        expect(item).to be_valid
    end

    it "is invalid price is too much maximum 9999999" do
        item = build(:item, price: 10000000)
        item.valid?
        expect(item.errors[:price]).to include("は一覧にありません")
    end

    it "is valid price is too much maximum 9999999" do
        item = build(:item, price: 9999999)
        expect(item).to be_valid
    end

    it "is invalid with a that has less than 300" do
        item = build(:item, price: 299)
        item.valid?
        expect(item.errors[:price]).to include("は一覧にありません")
    end

    it "is valid with a that has less than 300" do
        item = build(:item, price: 300)
        expect(item).to be_valid
    end
    
    it "is valid without a brand" do
        item = build(:item, brand: "")
        expect(item).to be_valid
    end
  end
end