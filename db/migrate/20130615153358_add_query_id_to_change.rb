class AddQueryIdToChange < ActiveRecord::Migration
  change_table :changes do |t|
    t.string :query_id
   end
end
