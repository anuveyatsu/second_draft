class CreateChangeNameCourierLegalDetails < ActiveRecord::Migration
  def change
     rename_table :courier_legal_details, :courier_legal_detail
   end 
 end
