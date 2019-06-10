class CreateTimeslots < ActiveRecord::Migration[5.0]
  def change
    create_table :timeslots do |t|
      t.string :slot
      t.integer :count
      t.integer :user_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
