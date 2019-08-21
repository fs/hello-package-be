class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.references :user, foreign_key: true
      t.string :room_id

      t.timestamps
    end
  end
end
