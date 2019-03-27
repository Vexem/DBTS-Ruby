class CreateMedicines < ActiveRecord::Migration[5.1]
  def change
    create_table :medicines, id: false do |t|
      t.decimal :medicine_id, precision:25, scale:0
      t.string :medicine_name
      t.timestamps
    end

    execute "alter table medicines add primary key (medicine_id);"

    Medicine.create medicine_id: '10', medicine_name: 'Karvea'
    Medicine.create medicine_id: '20', medicine_name: 'Torvast'
    Medicine.create medicine_id: '30', medicine_name: 'Glucophage'
    Medicine.create medicine_id: '40', medicine_name: 'Janumet'


  end
end
