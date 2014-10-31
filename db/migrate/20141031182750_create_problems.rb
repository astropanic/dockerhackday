class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :title
      t.text :description
      t.text :input
      t.text :output

      t.timestamps
    end
  end
end
