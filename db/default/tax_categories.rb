puts "Loading Tax categories ..."

catalan_translations = YAML.load_file("#{Rails.root}/config/locales/ca.yml")

# GENERAL 21%
Spree::TaxCategory.find_or_create_by!(:name => catalan_translations['ca']['tax_category_general'])

# REDUCIDO 10%
# Carne
Spree::TaxCategory.find_or_create_by!(:name => catalan_translations['ca']['tax_category_reducido'])


# SUPER REDUCIDO 4%
# Pan y cereales para su elaboración.
# Leche, queso y huevos.
# Frutas, verduras, hortalizas, legumbres y tubérculos naturales.
Spree::TaxCategory.find_or_create_by!(:name => catalan_translations['ca']['tax_category_super_reducido'])

