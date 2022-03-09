class ChangeFurimasToItems < ActiveRecord::Migration[6.0]
  def change
    rename_table :furimas, :items
  end
end
