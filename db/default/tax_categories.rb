puts "Loading Tax categories ..."

# GENERAL 21%
Spree::TaxCategory.create!(:name => "General")

# REDUCIDO 10%
# Carne
Spree::TaxCategory.create!(:name => "Reducido")


# SUPER REDUCIDO 4%
# Pan y cereales para su elaboración.
# Leche, queso y huevos.
# Frutas, verduras, hortalizas, legumbres y tubérculos naturales.
Spree::TaxCategory.create!(:name => "SuperReducido")

