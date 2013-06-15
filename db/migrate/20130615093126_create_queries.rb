class CreateQueries < ActiveRecord::Migration
  def change
    create_table :queries do |t|
      t.string :customer_email
      t.string :customer_name
      t.string :subject
      t.string :description
      t.string :user_id
      t.string :department_id
      t.string :status_id

      t.timestamps
    end
  end
end
