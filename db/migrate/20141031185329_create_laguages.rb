class CreateLaguages < ActiveRecord::Migration
  def change
    create_table :laguages do |t|
      t.string :name
      t.string :version

      t.timestamps
    end
  end
end
