class User < ActiveRecord::Base
  ROLES=["Студент" ,"Преподаватель", "Администратор"]
  has_many  :tests, dependent: :nullify

  validates :role, presence: true, inclusion: {in: 0...ROLES.size}

  def set_default_role
    self.role||=0
  end

  def human_role
    ROLES[role]
  end

  def admin?
    role==1
  end

  def self.edit?(u)
    u && u.admin?
  end
end
