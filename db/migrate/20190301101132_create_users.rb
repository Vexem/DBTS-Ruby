class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users, id: false do |t|
      t.integer :user_id, :limit => 5
      t.string :name
      t.string :surname
      t.string :oauth_token
      t.boolean :is_doctor
      t.datetime :oauth_expires_at
      t.timestamps

    end
    execute "alter table users add primary key (user_id);"
  end
end
