class CreateCrunches < ActiveRecord::Migration[5.0]
  def change
    create_table :crunches do |t|
      t.string :data_url
      t.text :tag_content
      t.string :a_tag_url

      t.timestamps
    end
  end
end
