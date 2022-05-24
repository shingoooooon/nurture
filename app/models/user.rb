class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tutor_users, :class_name => "Course", :foreign_key => :tutor_user_id
  has_many :student_users, :class_name => "Course", :foreign_key => :student_user_team_id
  has_one_attached :photo
  validate :check_role

  def select_label
    "#{first_name} #{last_name} <#{email}>"
  end

  def check_role
    errors.add(:role, "Role should be 'tutor' or 'student'") unless ["tutor", "student"].include?(role)
  end
end
