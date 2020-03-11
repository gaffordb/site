class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :fingerprint

      t.timestamps
    end
  end
end
