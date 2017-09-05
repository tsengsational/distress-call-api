class CreateCallSupporters < ActiveRecord::Migration[5.1]
  def change
    create_table :call_supporters do |t|
      t.integer :call_id
      t.integer :supporter_id

      t.timestamps
    end
  end
end
