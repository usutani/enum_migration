class User < ActiveRecord::Base
  enum status: [:registered, :associated, :retired, :deleted]

  after_update do
    Net::HTTP.get(URI.parse('http://www.example.com'))
    sleep 10
  end
end
