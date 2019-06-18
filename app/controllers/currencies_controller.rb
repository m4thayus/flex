class CurrenciesController < ApplicationController
    before_action :find_currency, only: [:show, :edit, :update, :destroy]
    
    def index
        @currencies = Currency.all
    end
    
    def show
    end
    
    def new
        @currency = Currency.new
    end
    
    def create
        @currency = Currency.new(
            currency_params(:name, :symbol)
        )
        if @currency.valid?
            @currency.save
            @currency.image.attach(params[:currency][:image])
            redirect_to @currency
        else
            render :new
        end
    end
    
    def edit
    end
    
    def update
        if @currency.valid?
            @currency.update(
                currency_params(:name, :symbol, :image)
                #added image to params here...
            )
            redirect_to @currency
        else
            render :edit
        end
    end
    
    def destroy
        @currency.destroy
        redirect_to currencies_path
    end
    
    private
    
        def find_currency
            @currency = Currency.find(params[:id])
        end
    
        def currency_params(*args)
            params.require(:currency).permit(*args)
        end
    
end
