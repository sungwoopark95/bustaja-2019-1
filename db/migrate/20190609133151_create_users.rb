class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :teamname
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
