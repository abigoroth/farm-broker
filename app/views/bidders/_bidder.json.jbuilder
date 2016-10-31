json.extract! bidder, :id, :name, :dob, :address, :phone, :credit_card, :created_at, :updated_at
json.url bidder_url(bidder, format: :json)