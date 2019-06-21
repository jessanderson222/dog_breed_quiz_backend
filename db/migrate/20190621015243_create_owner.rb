class CreateOwner < ActiveRecord::Migration[5.2]
  def change
    create_table :owners do |t|
      t.string :name
      t.string :profile_picture

      t.timestamps
    end
  end
end
