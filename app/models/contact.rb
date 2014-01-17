class Contact < ActiveRecord::Base
	has_many :phones, as: :contact_detail
	accepts_nested_attributes_for :phones, allow_destroy: true


	def self.copy(name)
		Contact.new(name: name).save if Contact.where(name: name).empty?
	end
end
