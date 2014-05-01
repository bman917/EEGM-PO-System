class AddStoreDetailsConfig < ActiveRecord::Migration
  def up
  	SystemConfig.create(name: 'store_mobile_number', value: '0999-197-2500', description: 'Store Mobile Number')
  	SystemConfig.create(name: 'store_landline_number', value: '6453017', description: 'Store Landline Number')
  	SystemConfig.create(name: 'store_fax_number', value: '6452210', description: 'Store Fax Number')
  	SystemConfig.create(name: 'store_email', value: 'ENGSHOESUPPLY@GMAIL.COM', description: 'Store Email Address')
  end

  def down
  	SystemConfig.delete_all(name: 'store_mobile_number')
  	SystemConfig.delete_all(name: 'store_landline_number')
    SystemConfig.delete_all(name: 'store_fax_number')
  	SystemConfig.delete_all(name: 'store_email')
  end
end
