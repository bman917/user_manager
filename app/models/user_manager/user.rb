module UserManager
  class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :recoverable, :rememberable, 
      :trackable, :validatable

    validates :username, presence: true, uniqueness: true

    def display
      if status_changed?
       "User: #{self.username} status to #{status_changed?.first}"
      else
        "User: #{self.username}"
      end
    end

    def status_changed?
      last_version = versions.try :last
      changeset = last_version.try :changeset
      changeset[:status] if changeset
    end


    def root_admin?
      username == 'admin'
    end

    def admin?
      self.role.try(:casecmp, "Admin") == 0
    end

    def viewer?
      self.role.try(:casecmp, "Viewer") == 0
    end

    def moderator?
      self.role.try(:casecmp, "Moderator") == 0
    end

    def active?
      self.try(:status) == "Active"
    end

    def active_for_authentication?
      super && (root_admin? || active?)
    end

    def inactive_message
      active? ? super : "Your user account has been desctivated."
    end
  end
end
