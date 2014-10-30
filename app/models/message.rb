class Message < ActiveRecord::Base
  belongs_to :sender, class_name: "User", primary_key: "id"
  belongs_to :recipient, class_name: "User", primary_key: "id"

  def read_message
  	self.read_at ||= Time.now
  	save
  end
end
