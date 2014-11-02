class AddContainerHashToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :container_hash, :string
  end
end
