class CreateMedics < ActiveRecord::Migration[5.1]
  def change
    create_table :medics, id: false do |t|
      t.string :medic_name
      t.string :medic_mail
      t.string :medic_hospital
      t.timestamps
    end

    execute "alter table medics add primary key (medic_name);"
    add_foreign_key :users, :medics, column: :medic_name, primary_key: "medic_name"
  end
end
