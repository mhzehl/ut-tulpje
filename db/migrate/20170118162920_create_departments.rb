class CreateDepartments < ActiveRecord::Migration[5.0]
  def change
    create_table :departments do |t|
      t.string :name
      t.string :description
      t.string :image_url

      t.timestamps
    end
  end
end
