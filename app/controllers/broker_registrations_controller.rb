class Brokers::RegistrationsController < Devise::RegistrationsController
  private
    def sign_up_params
      params.require(:broker).permit(:name, :dob, :address, :phone, :account_no, :email, :password, :password_confirmation)
    end
end
