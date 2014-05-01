class CreateSystemConfigs < ActiveRecord::Migration
  def change
    create_table :system_configs do |t|
      t.string :name
      t.string :value
      t.string :description

      t.timestamps
    end
  end
end
