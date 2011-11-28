class ChangeLogForTwitter < ActiveRecord::Migration
  def change
    change_table(:logs) do |t|
      t.string :text, :id_str, :user_id_str, :user_icon_url, :track
    end
  end
end
