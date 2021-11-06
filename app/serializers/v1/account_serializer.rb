# frozen_string_literal: true
module V1
  # AccountSerializer
  class AccountSerializer < ActiveModel::Serializer
    attributes :id,
               :email,
               :first_name,
               :last_name,
               :first_name_kana,
               :last_name_kana,
               :gender,
               :birthday,
               :email_verification_status,
               :last_sign_in_at,
               :created_at,
               :updated_at
  end
end
