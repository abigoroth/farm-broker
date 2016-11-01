class Farmer < ApplicationRecord
	has_one :user, as: :meta, dependent: :destroy
	has_many :farmsites
	has_many :produces
	has_many :bids

	def birth_date
    dob.strftime("%d/%m/%Y")
  end
end
