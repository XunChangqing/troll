class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tasks, :class_name => 'Task', foreign_key: 'owner_id'
  has_many :checked_tasks, :class_name => 'Task', foreign_key: 'checker_id'

  ROLES = %w[user.user_admin user.task_admin]

  def get_tasks(number)
    #byebug
    ctasks = unfinish_tasks(number)
    request_new_tasks(number-ctasks.count) if ctasks.count<number
    ctasks
  end

  def request_new_tasks(number=1)
    Task.transaction do
      Task.lock.where(owner: nil).limit(number).each do |tk|
        tk.owner = self
        tk.save
      end
    end
  end

    #find
    #where
    #limit
    #Task.transaction do
      #t = Task.lock.first
      #t.url = 'new'
      #t.save!
    #end
  def unfinish_tasks(number=1)
    ret = self.tasks.where(result: nil).limit(number)
      #if number
        #ret.limit(number)
  end
  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
    end
  end

  def is?(role)
    roles.include?(role.to_s)
  end
end
