class ChangeNullableInFromEmailFields < ActiveRecord::Migration
  def up
    change_column :user_notifications, :from_email, :text, null: true
    change_column :contribution_notifications, :from_email, :text, null: true
    change_column :project_post_notifications, :from_email, :text, null: true
    change_column :channel_post_notifications, :from_email, :text, null: true
    change_column :project_notifications, :from_email, :text, null: true
  end

  def down
    change_column :user_notifications, :from_email, :text, null: false
    change_column :contribution_notifications, :from_email, :text, null: false
    change_column :project_post_notifications, :from_email, :text, null: false
    change_column :channel_post_notifications, :from_email, :text, null: false
    change_column :project_notifications, :from_email, :text, null: false
  end
end