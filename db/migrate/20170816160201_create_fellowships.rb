class CreateFellowships < ActiveRecord::Migration[5.1]
  def change
    create_table :fellowships do |t|
      t.string :name
      t.string :description
      t.string :acronym

      t.timestamps
    end
  end
end
