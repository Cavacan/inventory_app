class EmailChangeRequest < ApplicationRecord
  belongs_to :user
  validates :new_email, presence: true, format: { with: :URI::MailTo::EMAIL_REGEXP }
end
