class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.references: user, nul: false
      t.string: title, nul: false
      t.string: 

      t.timestamps
    end
  end
end
