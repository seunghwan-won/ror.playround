class UsersController < ActionController:Base
    def create
        @User = User.create(user_parameters)

        registration = register_with_credit_card_service
        if registration
            add_customer_id_to_user(registration["id"])
        else
        end
    end

    private

    def register_with_credit_card_service
        CreditCardService.new({
            card: parameters[:stripe_token]
            email: parameters[:user][:email]
        }).create_customer
    end
    def add_customer_id_to_user(id)
        @user.update_attributes(external_customer_id: id)
    end
end
