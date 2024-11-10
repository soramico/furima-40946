class CreateDeliveryday < ActiveRecord::Migration[7.0]
  def change
    create_table :deliverydays do |t|

      t.timestamps
    end
  end
end
