class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.integer :publication_year
      t.references :shelf

      t.timestamps
    end
  end
end
