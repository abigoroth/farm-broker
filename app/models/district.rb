class District < ApplicationRecord
<<<<<<< HEAD
belongs_to :state
=======

	has_many :farmsites
  belongs_to :state
  has_many :bidders
  has_many :brokers

>>>>>>> de9f3590f7bec16feb9dfd6be2f6c5c8e5621320
end
