# frozen_string_literal: true

class AllocationsReflex < ApplicationReflex
  delegate :current_user, to: :connection
  include CableReady::Broadcaster
  before_reflex do
    if !element.data_allocation_id.nil?
      @allocation = Allocation.find(element.data_allocation_id)
    elsif !allocation_params[:id].nil?
      @allocation = Allocation.find(allocation_params[:id])
    else
      @allocation = Allocation.new
    end
  end

  def save
    morph :nothing
    @allocation.attributes = allocation_params

    if @allocation.save
      partial_html = AllocationsController.render(partial: 'allocation', locals: { allocation: @allocation })

      if @allocation.saved_change_to_attribute?(:id)
        cable_ready["general"].insert_adjacent_html(
          position: 'afterbegin',
          selector: '#allocations',
          html: partial_html
        )
      else
        cable_ready["general"].outer_html(
          selector: "#allocation-#{@allocation.id}",
          html: partial_html
        )
      end

      partial_html = AllocationsController.render(partial: 'form', locals: { allocation: Allocation.new })
      # unless current_user.nil?
      #   cable_ready["allocations"].inner_html(
      #     selector: "#form-allocations",
      #     html: partial_html
      #   )
      # else
        cable_ready["general"].inner_html(
          selector: "#form-allocations",
          html: partial_html
        )
      # end

      cable_ready["general"].inner_html(
        selector: "#car-allocations",
        html: Allocation.count
      )

      cable_ready.broadcast
    else
      broadcast_error_messages
    end
  end

  def destroy
    morph :nothing
    if @allocation
      @allocation.destroy
      cable_ready["general"].remove(
        selector: "#allocation-#{@allocation.id}"
      )

      cable_ready["general"].inner_html(
        selector: "#car-allocations",
        html: Allocation.count
      )

      partial_html = AllocationsController.render(partial: 'form', locals: { allocation: Allocation.new })
      cable_ready["general"].inner_html(
        selector: "#form-allocations",
        html: partial_html
      )
      cable_ready.broadcast
    end
  end

    private
    def allocation_params
      params.require(:allocation).permit(:id, :car_id, :document, :start_at, :end_at)
    end

    def broadcast_error_messages
      partial_html = AllocationsController.render(partial: 'form', locals: { allocation: @allocation })
      cable_ready["allocations"].inner_html(
        selector: "#form-allocations",
        html: partial_html
      )
      cable_ready.broadcast
    end
end
