class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.string :url
      t.string :type
      t.integer :log_id
      t.integer :workshop_id

      t.timestamps
    end
  end
end
