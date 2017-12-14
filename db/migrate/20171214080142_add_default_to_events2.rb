class AddDefaultToEvents2 < ActiveRecord::Migration[5.1]
  def change
    change_column :events, :starts_at, :datetime, :default => DateTime.new(1900,1,1,0,0,0)
    change_column :events, :ends_at, :datetime, :default => DateTime.new(1900,1,1,0,0,0)
  end
end
