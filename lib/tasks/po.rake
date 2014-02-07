namespace :po do
	desc "Recalculates All Totals"
	task :retotal => :environment do
		puts "Recalculating #{PurchaseItem.all.count} items..."
		PurchaseItem.all.each {|pi| pi.recalculate_total}
		puts "Retotal complete"

	end
end