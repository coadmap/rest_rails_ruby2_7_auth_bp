# frozen_string_literal: true
module Auth
  module V1
    # AuthController
    class AuthController < ApplicationController
      skip_before_action :authenticate_account!

      def sign_in
        account = Account.find_by(
          email: resource_params[:email]
        ).try(:authenticate, resource_params[:password])

        if account
          account.update!(last_sign_in_at: Time.zone.now)
          render json: {
            account: ::V1::AccountSerializer.new(account).as_json,
            token: account.jwt
          }
        else
          head 401
        end
      end

      def sign_up
        account = Account.create!(resource_params.merge(last_sign_in_at: Time.zone.now))
        render json: {
          account: ::V1::AccountSerializer.new(account).as_json,
          token: account.jwt
        }, status: 201
      end

      private

      def resource_params
        params.require(:account).permit(:email, :password)
      end
    end
  end
end
