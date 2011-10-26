class AddInfoOutToTracks < ActiveRecord::Migration
  def self.up
    add_column :tracks, :info_out, :text
  end

  def self.down
    remove_column :tracks, :info_out
  end
end
