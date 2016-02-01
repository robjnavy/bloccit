class AddTopicsRefToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :topic_id, index: true, foreign_key: true
  end
end
