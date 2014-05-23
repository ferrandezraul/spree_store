puts "Loading Tax rates ..."


zona_eu = Spree::Zone.find_or_create_by!(name: "EU_VAT", description: "Countries that make up the EU VAT zone.")

categoria_iva_general = Spree::TaxCategory.find_by_name!("General")

iva_general = Spree::TaxRate.create(
  :name => "IVA General",
  :zone => zona_eu,
  :amount => 0.21,  # 21 % IVA
  :tax_category => categoria_iva_general
)

iva_general.calculator = Spree::Calculator::DefaultTax.create!
iva_general.save!

categoria_iva_reducido = Spree::TaxCategory.find_by_name!("Reducido")

iva_reducido = Spree::TaxRate.create(
    :name => "IVA Reducido",
    :zone => zona_eu,
    :amount => 0.10,  # 10 % IVA
    :tax_category => categoria_iva_reducido
)

iva_reducido.calculator = Spree::Calculator::DefaultTax.create!
iva_reducido.save!


categoria_iva_super_reducido = Spree::TaxCategory.find_by_name!("Super Reducido")

iva_super_reducido = Spree::TaxRate.create(
    :name => "IVA Super Reducido",
    :zone => zona_eu,
    :amount => 0.04,  # 4 % IVA
    :tax_category => categoria_iva_super_reducido
)

iva_super_reducido.calculator = Spree::Calculator::DefaultTax.create!
iva_super_reducido.save!
