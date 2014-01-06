class Contact < ActiveRecord::Base
	has_many :phones, as: :contact_detail
	accepts_nested_attributes_for :phones, allow_destroy: true
end
