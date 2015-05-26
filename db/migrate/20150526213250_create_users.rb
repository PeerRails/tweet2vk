class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :full_name
      t.inet :last_ip
      t.date :last_login
      t.string :email
      t.string :profile_img

      t.timestamps null: false
    end
  end
end
