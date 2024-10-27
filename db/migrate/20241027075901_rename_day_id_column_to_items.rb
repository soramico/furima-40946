class RenameDayIdColumnToItems < ActiveRecord::Migration[7.0]
  def change
    rename_column :items, :day_id, :deliveryday_id
  end
end
