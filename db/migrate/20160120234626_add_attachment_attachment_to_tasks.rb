class AddAttachmentAttachmentToTasks < ActiveRecord::Migration
  def self.up
    change_table :tasks do |t|
      t.attachment :attachment
    end
  end

  def self.down
    remove_attachment :tasks, :attachment
  end
end
