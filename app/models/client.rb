# == Schema Information
#
# Table name: clients
#
#  id             :integer          not null, primary key
#  logo           :string
#  company_name   :string           default(""), not null
#  email          :string           default(""), not null
#  phone_number   :string           default(""), not null
#  vat_id         :integer
#  contact_person :string
#  visible        :boolean          default(FALSE), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Client < ActiveRecord::Base
    belongs_to :event
    #validates :logo
    validates :company_name,    presence: true, length: { minimum: 2 }
    validates :email,           presence: true, uniqueness: { case_sensitive: false }
    validates :phone_number,    presence: true
    validates :vat_id,          presence: true, length: { in: 6..10 }, numericality: true
    #validates :contact_person
    validates :visible,         presence: true, inclusion: { in: [true, false] } #, presence: true
end
