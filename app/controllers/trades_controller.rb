class TradesController < ApplicationController
    before_action :find_trade, only: [:show, :edit, :update, :destroy]
    
    def index
        @trades = Trade.all
    end
    
    def show
    end
    
    def new
        @trade = Trade.new
    end
    
    def create
        @trade = Trade.new(
            trade_params(:offered_amount, :offered_wallet_id)
        )
        if @trade.valid?
            @trade.save
            redirect_to @trade
        else
            render :new
        end
    end
    
    def edit
    end
    
    def update
        if @trade.valid?
            @trade.update(
                trade_params(:offered_amount, :offered_wallet_id)
            )
            redirect_to @trade
        else
            render :edit
        end
    end
    
    def destroy
        @trade.destroy
        redirect_to trades_path
    end
    
    private
    
        def find_trade
            @trade = Trade.find(params[:id])
        end
    
        def trade_params(*args)
            params.require(:trade).permit(*args)
        end
    
end
