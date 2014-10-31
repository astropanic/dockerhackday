class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.text :code
      t.integer :user_id
      t.integer :problem_id
      t.integer :language_id

      t.timestamps
    end
  end
end
