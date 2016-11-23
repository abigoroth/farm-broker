class Farmer < ApplicationRecord
	has_one :user, as: :meta, dependent: :destroy
	has_one :farmsite #tukar 1:1
	has_many :produces
	has_many :bids

	def birth_date
    	dob.strftime("%d/%m/%Y")
  	end

  	validates :name, :dob, presence: true
  	
  	scope :search, -> (keyword) { where("company_name like ?", "#{keyword}%")}

    scope :search_state, -> (state) {joins(:farmsite)
    .where("farmsites.farmsitestate = '#{state}'") if state.presence
    }
    scope :search_city, -> (city) {joins(:farmsite)
    .where("farmsites.farmsitecity = '#{city}'") if city.presence 
    }
end
