class AddAvatarColumnsToFarmsites < ActiveRecord::Migration[5.0]
 

  def up
    add_attachment :farmsites, :avatar
  end

  def down
    remove_attachment :farmsites, :avatar
  end

end
