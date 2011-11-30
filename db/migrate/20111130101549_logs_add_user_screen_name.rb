class LogsAddUserScreenName < ActiveRecord::Migration
  def change
    change_table :logs do |t|
      t.string :user_screen_name
    end
  end
end
