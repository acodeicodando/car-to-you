require 'rails_helper'

RSpec.describe User, type: :model do
  describe "create and update actions" do
    context "positive scenarios" do
      it "easy to create" do
        user = User.create(attributes_for(:user))
        expect(user).to be_truthy
      end
    end

    context "negative scenarios" do
      it "validate presence attributes" do
        user = User.new
        expect(user.valid?).to be_falsey
        expect(user.errors_on(:name)).to include("can't be blank")
        expect(user.errors_on(:email)).to include("can't be blank")
        expect(user.errors_on(:password)).to include("can't be blank")
      end

      it "validate uniq attributes" do
        create(:user)
        user = build(:user)
        expect(user.valid?).to be_falsey
        expect(user.errors_on(:email)).to include("has already been taken")
      end

      it "validate presence of password confirmation" do
        user = build(:user)
        user.password = '123'
        expect(user.valid?).to be_falsey
        expect(user.errors_on(:password_confirmation)).to include("doesn't match Password")
      end
    end

  end
end
