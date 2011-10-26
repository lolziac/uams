class RemoveInfoToTracks < ActiveRecord::Migration
  def self.up
    remove_column :tracks, :info
  end

  def self.down
    add_column :tracks, :info, :text
  end
end
