class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update, :destroy]
    before_action :authorized
    
    def show
    end
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(
            user_params(:name)
        )
        if @user.valid?
            @user.save
            redirect_to @user
        else
            render :new
        end
    end
    
    def edit
    end
    
    def update
        if @user.valid?
            @user.update(
                user_params(:name)
            )
            redirect_to @user
        else
            render :edit
        end
    end
    
    def destroy
        @user.destroy
        redirect_to users_path
    end
    
    private
    
        def find_user
            @user = User.find(params[:id])
        end
    
        def user_params(*args)
            params.require(:user).permit(*args)
        end
    
end
