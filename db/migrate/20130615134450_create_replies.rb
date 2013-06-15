class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.string :reply_description

      t.timestamps
    end
  end
end
