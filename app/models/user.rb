class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role_id
  # attr_accessible :title, :body
  belongs_to :role
  before_create :set_default_role

  def is_admin?
  	return self.role.name == 'admin'
  end

  def is_secretary?
    return self.role.name == 'secretary'
  end

  private
  def set_default_role
  	self.role ||= Role.where(name: 'secretary').first
  end
end
