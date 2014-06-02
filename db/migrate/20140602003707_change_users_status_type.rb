class ChangeUsersStatusType < ActiveRecord::Migration
  def up
    rename_column :users, :status, :status_string
    add_column :users, :status, :integer
    User.find_each do |user|
      user.update(status: user.status_string.try(:downcase))
    end
  end

  def down
    User.find_each do | user |
      user.update(status_string: user.status.try(:capitalize))
    end
    remove_column :users, :status
    rename_column :users, :status_string, :status
  end
end
