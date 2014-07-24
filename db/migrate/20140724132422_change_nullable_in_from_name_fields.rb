class ChangeNullableInFromNameFields < ActiveRecord::Migration
  def up
    change_column :user_notifications, :from_name, :text, null: true
    change_column :contribution_notifications, :from_name, :text, null: true
    change_column :project_post_notifications, :from_name, :text, null: true
    change_column :channel_post_notifications, :from_name, :text, null: true
    change_column :project_notifications, :from_name, :text, null: true
  end

  def down
    change_column :user_notifications, :from_name, :text, null: false
    change_column :contribution_notifications, :from_name, :text, null: false
    change_column :project_post_notifications, :from_name, :text, null: false
    change_column :channel_post_notifications, :from_name, :text, null: false
    change_column :project_notifications, :from_name, :text, null: false
  end
end