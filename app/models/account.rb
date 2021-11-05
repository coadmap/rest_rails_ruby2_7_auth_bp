# frozen_string_literal: true
# Account
class Account < ApplicationRecord
  include JWT::Authenticatable

  has_secure_password

  module EmailVerificationStatus
    UNSPECIFIED = 'unspecified'
    VERIFIED = 'verified'
  end

  enum email_verification_status: { unspecified: 0, verified: 1 }, _suffix: true

  validates :email, presence: true, uniqueness: true, format: URI::MailTo::EMAIL_REGEXP
  validates :password, length: { minimum: 8 }, if: -> { password.present? }
end
