class CreateSupporters < ActiveRecord::Migration[5.1]
  def change
    create_table :supporters do |t|
      t.string :first_name
      t.string :last_initial
      t.string :phone

      t.timestamps
    end
  end
end
