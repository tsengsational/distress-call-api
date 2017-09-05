class CreateSupporterCircles < ActiveRecord::Migration[5.1]
  def change
    create_table :supporter_circles do |t|
      t.integer :supporter_id
      t.integer :circle_id

      t.timestamps
    end
  end
end
