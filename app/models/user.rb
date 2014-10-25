class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :newsposts

  def active_for_authentication? # Blocks login for unapproved users
    super && approved? 
  end 

  def inactive_message 
    if !approved? 
      :not_approved 
    else 
      super
    end 
  end


end
