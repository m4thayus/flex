class WalletsController < ApplicationController
    before_action :find_wallet, only: [:show, :destroy]
    before_action :authorized

    def index
        @wallets = get_current_user.wallets
    end
    
    def show
    end
    
    def new
        @wallet = Wallet.new
    end
    
    def create
        @user = get_current_user
        @wallet = Wallet.new(
            wallet_params(:currency_id, :amount)
        )
        @wallet.user = @user
        if @wallet.valid?
            @wallet.save
            redirect_to @wallet
        else
            render :new
        end
    end
    
    def destroy
        @wallet.destroy
        redirect_to wallets_path
    end
    
    private
    
        def find_wallet
            @wallet = Wallet.find(params[:id])
            if get_current_user.wallets.include?(@wallet)
                @wallet
            else
                @wallet = nil
                redirect_to login_path
            end
        end
    
        def wallet_params(*args)
            params.require(:wallet).permit(*args)
        end
    
end
