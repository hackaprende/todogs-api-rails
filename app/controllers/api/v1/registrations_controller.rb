class Api::V1::RegistrationsController < Devise::RegistrationsController
    before_action :ensure_params_exist, :ensure_password_long_enough, :ensure_password_match, only: :create

    # Sign up
    def create
        if User.exists?(email: params[:email])
            json_response "user_already_exists", false, { }, :ok
            return
        end

        user = User.new user_params

        if user.save
            json_response "Signed up successfully", true, { user: user }, :ok
        else
            json_response "something_wrong", false, { }, :unprocessable_entity
        end
    end

    private
    def user_params
        params.require(:email)
        params.require(:password)
        params.require(:password_confirmation)
        params.permit(:email, :password, :password_confirmation)
    end

    def ensure_params_exist
        return if params[:email].present? && params[:password].present? && params[:password_confirmation].present?
        json_response "Missing params", false, { }, :bad_request
    end

    def ensure_password_long_enough
        return if params[:password].length >= 8 && params[:password_confirmation].length >= 8
        json_response "Password needs at least 8 characters", false, { }, :bad_request
    end

    def ensure_password_match
        return if params[:password] == params[:password_confirmation]
        json_response "Passwords do not match", false, { }, :bad_request
    end
end