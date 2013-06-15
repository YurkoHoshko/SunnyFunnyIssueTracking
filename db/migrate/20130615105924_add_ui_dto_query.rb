class AddUiDtoQuery < ActiveRecord::Migration
  change_table :queries do |t|
  t.string :uid
   end
end
