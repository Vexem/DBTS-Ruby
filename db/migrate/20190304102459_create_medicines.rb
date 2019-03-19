class CreateMedicines < ActiveRecord::Migration[5.1]
  def change
    create_table :medicines, id: false do |t|
      t.integer :medicine_id, :limit => 5
      t.string :medicine_name
      t.timestamps
    end

    execute "alter table medicines add primary key (medicine_id);"
  end
end
