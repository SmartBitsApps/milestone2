class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @clients = Client.all
  end

  def show
  end

  def new
    @client = Client.new
  end

  def edit
  end

  def create
    @client = Client.new(client_params)
    
    if @client.save
      redirect_to @client, notice: 'Klient byl vytvořen.'
    else
      render :new
    end
  
  end

  def update
    if @client.update(client_params)
      redirect_to @client, notice: 'Klient byl upraven.'
    else
      render :edit
    end
  end

  def destroy
    @client.destroy
    redirect_to clients_url, notice: 'Klient byl smazán.'
  end

  private
    def set_client
      @client = Client.find(params[:id])
    end

    def client_params
      params.require(:client).permit(:logo, :company_name, :email, :phone_number, :vat_id, :contact_person, :visible)
    end
end
