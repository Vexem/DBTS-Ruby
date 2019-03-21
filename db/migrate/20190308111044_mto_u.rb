class MtoU < ActiveRecord::Migration[5.1]
  def change
    create_table :medicinetousers, id: false do |t|
      t.belongs_to :user, type: :decimal, precision: 25, scale:0
      t.belongs_to :medicine,  type: :decimal, precision:25, scale:0
      t.timestamps
    end
    execute"alter table medicinetousers	add constraint medicinetousers_pk	primary key (user_id, medicine_id);"
    add_foreign_key :medicinetousers, :users, column: :user_id, primary_key: "user_id"
    add_foreign_key :medicinetousers, :medicines, column: :medicine_id, primary_key: "medicine_id"
  end

end
