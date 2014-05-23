puts "Loading Zones ..."

eu_vat = Spree::Zone.find_or_create_by!(name: "EU_VAT", description: "Countries that make up the EU VAT zone.")

["Spain"].each do |name|
  eu_vat.zone_members.create!(zoneable: Spree::Country.find_by!(name: name))
end


