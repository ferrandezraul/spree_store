puts "Loading Tax categories ..."

# GENERAL 21%
Spree::TaxCategory.find_or_create_by!(:name => "General")

# REDUCIDO 10%
# Carne
Spree::TaxCategory.find_or_create_by!(:name => "Reducido")


# SUPER REDUCIDO 4%
# Pan y cereales para su elaboración.
# Leche, queso y huevos.
# Frutas, verduras, hortalizas, legumbres y tubérculos naturales.
Spree::TaxCategory.find_or_create_by!(:name => "SuperReducido")

