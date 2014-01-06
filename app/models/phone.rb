class Phone < ActiveRecord::Base
	belongs_to :contact_detail, :polymorphic => true
end
