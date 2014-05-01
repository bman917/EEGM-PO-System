class SystemConfig < ActiveRecord::Base
	validates :name, uniqueness: true

	def to_s
		value
	end
	
end
