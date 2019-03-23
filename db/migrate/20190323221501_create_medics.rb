class CreateMedics < ActiveRecord::Migration[5.1]
  def change
    create_table :medics, id: false do |t|
      t.integer :medic_id
      t.string :medic_name
      t.string :medic_mail
      t.string :medic_hospital
      t.timestamps
    end
    execute "alter table medics add primary key (medic_id);"
    add_foreign_key :users, :medics, column: :medic_id, primary_key: "medic_id"
  end
end
