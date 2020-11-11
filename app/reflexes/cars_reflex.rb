# frozen_string_literal: true
class CarsReflex < ApplicationReflex
  delegate :current_user, to: :connection
  include CableReady::Broadcaster
  before_reflex do
    unless element.data_brand_id.nil?
      @brand_id = element.data_brand_id
    end

    unless element.data_model_id.nil?
      @model_id = element.data_model_id
    end
    @id = element.attributes["value"]

    if !element.data_car_id.nil?
      @car = Car.find(element.data_car_id)
    elsif !car_params[:id].nil?
      @car = Car.find(car_params[:id])
    else
      @car = Car.new
    end
  end

  def get_models
    morph :nothing
    cable_ready["cars"].inner_html(
      selector: "#car-models",
      html: 'Just a moment, collecting the information'
    )
    cable_ready.broadcast
    models = Car.models(@id)
    partial_html = CarsController.render(partial: 'models', locals: { brand_id: @id, models: models})
    cable_ready["cars"].inner_html(
      selector: "#car-models",
      html: partial_html
    )
    cable_ready.broadcast
  end

  def get_fipe_models
    morph :nothing
    cable_ready["cars"].inner_html(
      selector: "#fipe-models",
      html: 'Just a moment, collecting the information'
    )
    cable_ready.broadcast
    fipe_models = Car.fipe_models(@brand_id, @id)
    partial_html = CarsController.render(partial: 'fipe_models', locals: { brand_id: @brand_id, model_id: @id, fipe_models: fipe_models})
    cable_ready["cars"].inner_html(
      selector: "#fipe-models",
      html: partial_html
    )
    cable_ready.broadcast
  end

  def get_fipe_data
    morph :nothing
    fipe_data = Car.fipe_data(@brand_id, @model_id, @id)

    # Hidden fields
    cable_ready["cars"].set_value(
      selector: "#car_brand",
      value: fipe_data["marca"]
    )

    cable_ready["cars"].set_value(
      selector: "#car_model",
      value: fipe_data["name"]
    )

    cable_ready["cars"].set_value(
      selector: "#car_fipe_code",
      value: "#{fipe_data["name"]} :: #{fipe_data["ano_modelo"]} #{fipe_data["combustivel"]}"
    )

    # Visible fields
    cable_ready["cars"].set_value(
      selector: "#car_name",
      value: fipe_data["name"]
    )

    cable_ready["cars"].set_value(
      selector: "#car_model_year",
      value: fipe_data["referencia"]
    )

    cable_ready["cars"].set_value(
      selector: "#car_year_manufacture",
      value: fipe_data["ano_modelo"]
    )
    cable_ready.broadcast
  end

  def edit
    morph :nothing
    partial_html = CarsController.render(partial: 'form', locals: { car: @car })
    cable_ready["cars"].inner_html(
      selector: "#form-cars",
      html: partial_html
    )
    cable_ready.broadcast
  end

  def save
    morph :nothing
    @car.attributes = car_params

    if @car.save
      partial_html = CarsController.render(partial: 'car', locals: { car: @car })

      if @car.saved_change_to_attribute?(:id)
        cable_ready["cars"].insert_adjacent_html(
          position: 'afterbegin',
          selector: '#cars',
          html: partial_html
        )
      else
        cable_ready["cars"].outer_html(
          selector: "#car-#{@car.id}",
          html: partial_html
        )
      end

      partial_html = CarsController.render(partial: 'form', locals: { car: Car.new })
      cable_ready["cars"].inner_html(
        selector: "#form-cars",
        html: partial_html
      )
      cable_ready.broadcast
    else
      broadcast_error_messages
    end
  end

  def destroy
    morph :nothing
    if @car
      @car.destroy
      cable_ready["cars"].remove(
        selector: "#car-#{@car.id}"
      )
      cable_ready.broadcast
    end
  end

  private
    def car_params
      params.require(:car).permit(
        :id, :brand, :brand_id, :model, :model_id,
        :fipe_code, :fipe_id, :name, :lisence_plate,
        :model_year, :year_manufacture)
    end

    def broadcast_error_messages
      partial_html = CarsController.render(partial: 'form', locals: { car: @car })
      cable_ready["cars"].inner_html(
        selector: "#form-cars",
        html: partial_html
      )
      cable_ready.broadcast
    end
end
