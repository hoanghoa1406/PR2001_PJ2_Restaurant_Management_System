class RegistrationsController < ApplicationController
  before_action :set_registration, only: [:show, :edit, :update, :destroy]

  # GET /registrations
  # GET /registrations.json
  def create
    @registration = Registration.new(registration_params)
    if @registration.save
      redirect_to @registration.paypal_url(registration_path(@registration))
    else
      render :new
    end
  end
end 