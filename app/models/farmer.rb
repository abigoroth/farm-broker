class Farmer < ApplicationRecord
	has_one :user, as: :meta, dependent: :destroy
end
