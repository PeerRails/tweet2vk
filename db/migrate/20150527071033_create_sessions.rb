class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.integer :user_id
      t.inet :ip
      t.timestamp :expires_at

      t.timestamps null: false
    end
    add_index :sessions, :user_id
  end
end
