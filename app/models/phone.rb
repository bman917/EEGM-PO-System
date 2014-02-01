class Phone < ActiveRecord::Base
  include PublicActivity::Common
  belongs_to :contact_detail, :polymorphic => true

  def details
    "#{contact_detail.details} - #{number}"
  end

  def record_activity(action, current_user, description)
    create_activity action, 
        owner: current_user, 
        recipient: contact_detail,
        parameters: {
        description: description,
        details: self.details}
  end
  
end
