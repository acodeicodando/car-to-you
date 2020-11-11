require 'rails_helper'

RSpec.describe Car, type: :model do
  describe "create and update actions" do
    context "positive scenarios" do
      it "easy to create" do
        car = Car.create(attributes_for(:car))
        expect(car).to be_truthy
      end

      it "validate uniq attributes changing one of them" do
        create(:car)
        car = build(:car, car_year_manufacture: 2015)
        expect(car.valid?).to be_truthy
      end
    end

    context "negative scenarios" do
      it "validate presence attributes" do
        car = Car.new
        expect(car.valid?).to be_falsey
        expect(car.errors_on(:car_model)).to include("can't be blank")
        expect(car.errors_on(:car_model_id)).to include("can't be blank")
        expect(car.errors_on(:brand)).to include("can't be blank")
        expect(car.errors_on(:brand_id)).to include("can't be blank")
        expect(car.errors_on(:name)).to include("can't be blank")
        expect(car.errors_on(:lisence_plate)).to include("can't be blank")
        expect(car.errors_on(:car_model_year)).to include("can't be blank")
        expect(car.errors_on(:car_year_manufacture)).to include("can't be blank")
      end

      it "validate uniq attributes" do
        create(:car)
        car = build(:car)
        expect(car.valid?).to be_falsey
        expect(car.errors_on(:car_model)).to include("has already been taken")
      end
    end

  end
end
