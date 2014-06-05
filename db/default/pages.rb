catalan_translations = YAML.load_file("#{Rails.root}/config/locales/ca.yml")
spanish_translations = YAML.load_file("#{Rails.root}/config/locales/es.yml")


Spree::Page.find_or_create_by_slug!( title: catalan_translations['ca']['qui-som'],
                                     body: catalan_translations['ca']['qui-som-body'],
                                     slug: "/qui-som",
                                     show_in_header: true,
                                     show_in_footer: false,
                                     visible: true )