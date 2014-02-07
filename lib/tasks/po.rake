namespace :po do
	desc "Recalculates All Totals"
	task :retotal => :environment do
		puts "Recalculating #{PurchaseItem.all.count} items..."
		PurchaseItem.all.each do |pi| 
			pi.recalculate_total
			pi.save
		end
		puts "Retotal complete"

	end
end