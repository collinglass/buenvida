class AddUserIdToMemories < ActiveRecord::Migration[5.0]
  def change
    add_reference :memories, :user, foreign_key: true
  end
end
