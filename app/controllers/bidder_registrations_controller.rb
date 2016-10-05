class Bidders::RegistrationsController < Devise::RegistrationsController
  private
    def sign_up_params
      params.require(:broker).permit(:name, :dob, :address, :phone, :credit_card, :email, :password, :password_confirmation)
    end
end
