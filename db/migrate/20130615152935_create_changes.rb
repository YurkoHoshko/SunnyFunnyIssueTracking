class CreateChanges < ActiveRecord::Migration
  def change
    create_table :changes do |t|
      t.string :change_description

      t.timestamps
    end
  end
end
