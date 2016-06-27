# == Schema Information
#
# Table name: positions
#
#  id           :integer          not null, primary key
#  title        :string           default(""), not null
#  description  :text             default(""), not null
#  requirements :text             default(""), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Position < ActiveRecord::Base
end
