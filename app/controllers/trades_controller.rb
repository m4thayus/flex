class TradesController < ApplicationController
    before_action :find_trade, only: [:show, :edit, :update, :destroy]
    before_action :authorized, except: [:index, :show]
    
    def index
        @trades = Trade.all
    end
    
    def show
    end
    
    def new
        @trade = Trade.new
        @user = get_current_user
    end
    
    def create
        @trade = Trade.new(
            trade_params(:offered_amount, :offered_wallet_id, :requested_amount, :requested_wallet_id)
        )
        if @trade.valid?
            @trade.completed = false
            offered_amount = @trade.offered_amount
             @trade.offered_wallet.credit(offered_amount)
            @trade.save
            matching_trade?
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
        
        def matching_trade?
          Trade.all.each do |t|
            if !t.completed && match?(t, @trade)
              t.requested_wallet.debit(@trade.offered_amount)
              @trade.requested_wallet.debit(t.offered_amount)
              t.completed = true
              @trade.completed = true
              t.save
              @trade.save
            else
              nil
            end
          end
        end
        
        def match?(trade, new_trade)
          new_trade.offered_currency == trade.requested_currency && new_trade.offered_amount >= trade.requested_amount && new_trade.requested_currency == trade.offered_currency &&
          new_trade.requested_amount == trade.offered_amount
        end
    
end
