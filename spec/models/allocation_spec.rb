require 'rails_helper'

RSpec.describe Allocation, type: :model do
  describe "create and update actions" do
    context "positive scenarios" do
      it "easy to create" do
        allocation = Allocation.create(attributes_for(:allocation))
        expect(allocation).to be_truthy
      end
    end

    context "negative scenarios" do
      it "validate presence attributes" do
        allocation = Allocation.new
        expect(allocation.valid?).to be_falsey
        expect(allocation.errors_on(:car)).to include("must exist")
        expect(allocation.errors_on(:document)).to include("can't be blank")
        expect(allocation.errors_on(:start_at)).to include("can't be blank")
        expect(allocation.errors_on(:end_at)).to include("can't be blank")
      end
    end
  end
end
