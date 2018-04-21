class ChangeIntegerLimitInOrderTable < ActiveRecord::Migration[5.1]
   def change
     change_column :orders, :class_id, :integer, limit: 16
     change_column :orders, :instance_id, :integer, limit: 16
   end 
end
