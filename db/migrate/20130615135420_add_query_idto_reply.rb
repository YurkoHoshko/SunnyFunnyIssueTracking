class AddQueryIdtoReply < ActiveRecord::Migration
  change_table :replies do |t|
  t.string :query_id
   end
end
