class UserController < ApplicationController
    def index
        @users = User.all
        json_response(@users)
    end

    def show
        @user = User.find_by(id: params[:id])
        json_response(@user)
    end

    def create
        @user = User.new(user_params)
        if @user.save
            json_response({success: true, message: "New user added!", user: user_params})
        else
            json_response({success: false, message: "Something went wrong!"}, :unprocessable_entity)
        end
    end

    def update
        @user = User.find_by(id: params[:id]).update(user_params)
        if @user 
            json_response({success: true, message: "User successfully updated!", user: user_params})
        else
            json_response({success: false, message: "Something went wrong in updating!"}, :unprocessable_entity)
        end
    end

    def destroy
        @user = User.find_by(id: params[:id]).destroy
        if @user
            json_response([])
        else
            json_response({success: false, message: "Something went wrong with deletion!"}, :unprocessable_entity)
        end 
    end

    def search
        @user = User.search(params[:search])
        json_response(@user)
    end 

    private 
    def user_params
        params.require(:user).permit(:firstname, :lastname, :email)
    end
end
