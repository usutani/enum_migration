class User < ActiveRecord::Base
  enum status: [:registered, :associated, :retired, :deleted]
end
