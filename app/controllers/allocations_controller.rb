class AllocationsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @allocation = Allocation.new
    @allocations = Allocation.all
  end
end
