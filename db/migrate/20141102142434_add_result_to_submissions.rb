class AddResultToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :result, :text
  end
end
