class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users, id: false do |t|
      t.decimal :user_id, type: :decimal, precision:25, scale:0
      t.string :provider
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :email
      t.integer :medic_id
      t.string :oauth_token
      t.datetime :oauth_expires_at

      # t.string   "provider"
      # t.string   "uid"
      # t.string   "name"
      # t.string   "oauth_token"
      # t.datetime "oauth_expires_at"
      # t.datetime "created_at"
      # t.datetime "updated_at"
    end
    execute "alter table users add primary key (user_id);"

  end
end
