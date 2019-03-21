class CreateMeasurements < ActiveRecord::Migration[5.1]
  def change
    create_table :measurements, id: false do |t|
      t.decimal :patient_id, type: :decimal, precision:25, scale:0
      t.integer :value
      t.timestamps
    end
     execute "alter table measurements add primary key (patient_id, created_at);"
     execute "alter table measurements drop column updated_at;"
    add_foreign_key :measurements, :users, column: :patient_id, primary_key: "user_id"
  end
end
