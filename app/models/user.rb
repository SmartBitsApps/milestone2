# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  role                   :integer
#  avatar                 :string
#  first_name             :string
#  last_name              :string
#  name                   :string
#  birth_name             :string
#  birth_date             :string
#  gender                 :string
#  birth_number           :string
#  birth_place            :string
#  nationality            :string
#  family_status          :string
#  status                 :string
#

class User < ActiveRecord::Base
  
  has_many :events
  has_many :subscriptions
           
  mount_uploader :avatar, AvatarUploader
  
  enum role: [:user, :manager, :admin]
  #enum gender: [:man, :woman]
  #enum gender: {:man => "Muž",:woman => "Žena"}
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end
  
  #validates :email,       presence: true, uniqueness: { case_sensitive: false }
  #validates :password,    presence: true
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  
end
