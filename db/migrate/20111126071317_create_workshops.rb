class CreateWorkshops < ActiveRecord::Migration
  def change
    create_table :workshops do |t|
      t.string :name
      t.date :date_on
      t.string :hashtag

      t.timestamps
    end
  end
end
