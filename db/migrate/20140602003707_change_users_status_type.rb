class ChangeUsersStatusType < ActiveRecord::Migration
  def up
    rename_column :users, :status, :status_string
    add_column :users, :status, :integer
    User.find_each do |user|
      raw_status = if user.status_string
                     User.statuses[user.status_string.downcase]
                   else
                     nil
                   end
      user.update_column(:status, raw_status)
    end
  end

  def down
    User.find_each do |user|
      user.update_column(:status_string, user.status.try(:capitalize))
    end
    remove_column :users, :status
    rename_column :users, :status_string, :status
  end
end
