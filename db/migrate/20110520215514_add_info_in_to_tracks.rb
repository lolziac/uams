class AddInfoInToTracks < ActiveRecord::Migration
  def self.up
    add_column :tracks, :info_in, :text
  end

  def self.down
    remove_column :tracks, :info_in
  end
end
