class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users, id: false do |t|
      t.decimal :user_id, precision:25, scale:0
      t.string :provider
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :email
      t.string :oauth_token
      t.datetime :oauth_expires_at
    end
    execute "alter table users add primary key (user_id);"
  end
end
