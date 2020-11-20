require 'rails_helper'

RSpec.describe AllocationsReflex, type: :reflex do
  before(:all) do

  end
  describe "something to be performed" do
    context "under condition" do
      it "behaves like" do
        user = create(:user)
        instance_double("Allocation", "current_user", current_user: user)
        # allow_any_instance_of(Allocation).to receive(:current_user).and_return(user)
      end
    end
  end

end
