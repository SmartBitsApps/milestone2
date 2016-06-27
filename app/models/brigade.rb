# == Schema Information
#
# Table name: brigades
#
#  id          :integer          not null, primary key
#  event_id    :integer
#  position_id :integer
#  quantity    :integer          default(0), not null
#  visible     :boolean          default(FALSE), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Brigade < ActiveRecord::Base
  belongs_to :event
  has_many :positions
  has_many :subscriptions
end
