class CreateMedicines < ActiveRecord::Migration[5.1]
  def change
    create_table :medicines, id: false do |t|
      t.decimal :medicine_id, precision:25, scale:0
      t.string :medicine_name
      t.timestamps
    end

    execute "alter table medicines add primary key (medicine_id);"
  end
end
