class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  # http://blog.plataformatec.com.br/2009/08/embracing-rest-with-mind-body-and-soul/

  def index
    @pins = Pin.all
    respond_with(@pins)
  end

  def show
    respond_with(@pin)
  end

  def new
    @pin = Pin.new
    respond_with(@pin)
  end

  def edit
  end

  def create
    @pin = Pin.new(pin_params)
    @pin.save
    respond_with(@pin)
  end

  def update
    @pin.update(pin_params)
    respond_with(@pin)
  end

  def destroy
    @pin.destroy
    respond_with(@pin)
  end

  private
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def pin_params
      params.require(:pin).permit(:description, :title)
    end
end
