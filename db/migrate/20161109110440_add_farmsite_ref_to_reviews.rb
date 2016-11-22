class AddFarmsiteRefToReviews < ActiveRecord::Migration[5.0]
  def change
    add_reference :reviews, :farmsite, foreign_key: true
  end
end
