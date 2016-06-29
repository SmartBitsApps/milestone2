# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  client_id   :integer
#  title       :string           default(""), not null
#  description :text             default(""), not null
#  image       :string
#  start_date  :string           default(""), not null
#  end_date    :string           default(""), not null
#  address     :string           default(""), not null
#  manager     :integer
#  visible     :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Event < ActiveRecord::Base
  belongs_to :user
  has_one :client
  accepts_nested_attributes_for :client
  has_many :brigades
  
  validates :title,           presence: true
  validates :description,     presence: true
  validates :start_date,      presence: true
  validates :end_date,        presence: true
  validates :address,         presence: true
  validates :manager,         numericality: true
  #validates :visible,         inclusion: { in: [true, false, nil] } #, presence: true
  
  mount_uploader :image, ImageUploader
  
end
