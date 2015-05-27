class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :provider
      t.integer :user_id
      t.string :name
      t.string :nickname
      t.integer :uid
      t.string :url
      t.string :token
      t.string :secret
      t.string :profile_img_url

      t.timestamps null: false
    end
    add_index :accounts, :user_id
  end
end
