class Api::V1::RegistrationsController < Devise::RegistrationsController
    before_action :ensure_params_exist, only: :create

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
end