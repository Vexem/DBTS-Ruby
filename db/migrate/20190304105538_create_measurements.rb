class CreateMeasurements < ActiveRecord::Migration[5.1]
  def change
    create_table :measurements, id: false do |t|
      t.integer :patient_id, :limit =>5
      t.integer :value
      t.timestamps
    end
     execute "alter table measurements add primary key (patient_id, created_at);"
     execute "alter table measurements drop column updated_at;"
  end
end
