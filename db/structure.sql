CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE TABLE "spree_addresses" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "firstname" varchar(255), "lastname" varchar(255), "address1" varchar(255), "address2" varchar(255), "city" varchar(255), "zipcode" varchar(255), "phone" varchar(255), "state_name" varchar(255), "alternative_phone" varchar(255), "company" varchar(255), "state_id" integer, "country_id" integer, "created_at" datetime, "updated_at" datetime);
CREATE INDEX "index_addresses_on_firstname" ON "spree_addresses" ("firstname");
CREATE INDEX "index_addresses_on_lastname" ON "spree_addresses" ("lastname");
CREATE TABLE "spree_assets" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "viewable_id" integer, "viewable_type" varchar(255), "attachment_width" integer, "attachment_height" integer, "attachment_file_size" integer, "position" integer, "attachment_content_type" varchar(255), "attachment_file_name" varchar(255), "type" varchar(75), "attachment_updated_at" datetime, "alt" text);
CREATE INDEX "index_assets_on_viewable_id" ON "spree_assets" ("viewable_id");
CREATE INDEX "index_assets_on_viewable_type_and_type" ON "spree_assets" ("viewable_type", "type");
CREATE TABLE "spree_calculators" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "type" varchar(255), "calculable_id" integer, "calculable_type" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "spree_configurations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "type" varchar(50), "created_at" datetime, "updated_at" datetime);
CREATE INDEX "index_spree_configurations_on_name_and_type" ON "spree_configurations" ("name", "type");
CREATE TABLE "spree_gateways" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "type" varchar(255), "name" varchar(255), "description" text, "active" boolean DEFAULT 't', "environment" varchar(255) DEFAULT 'development', "server" varchar(255) DEFAULT 'test', "test_mode" boolean DEFAULT 't', "created_at" datetime, "updated_at" datetime);
CREATE TABLE "spree_log_entries" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "source_id" integer, "source_type" varchar(255), "details" text, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "spree_option_types" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(100), "presentation" varchar(100), "position" integer DEFAULT 0 NOT NULL, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "spree_option_types_prototypes" ("prototype_id" integer, "option_type_id" integer);
CREATE TABLE "spree_option_values" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "position" integer, "name" varchar(255), "presentation" varchar(255), "option_type_id" integer, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "spree_option_values_variants" ("variant_id" integer, "option_value_id" integer);
CREATE INDEX "index_option_values_variants_on_variant_id_and_option_value_id" ON "spree_option_values_variants" ("variant_id", "option_value_id");
CREATE INDEX "index_spree_option_values_variants_on_variant_id" ON "spree_option_values_variants" ("variant_id");
CREATE TABLE "spree_product_option_types" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "position" integer, "product_id" integer, "option_type_id" integer, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "spree_product_properties" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "value" varchar(255), "product_id" integer, "property_id" integer, "created_at" datetime, "updated_at" datetime, "position" integer DEFAULT 0);
CREATE INDEX "index_product_properties_on_product_id" ON "spree_product_properties" ("product_id");
CREATE TABLE "spree_properties" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "presentation" varchar(255) NOT NULL, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "spree_properties_prototypes" ("prototype_id" integer, "property_id" integer);
CREATE TABLE "spree_prototypes" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "spree_roles" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255));
CREATE TABLE "spree_roles_users" ("role_id" integer, "user_id" integer);
CREATE INDEX "index_spree_roles_users_on_role_id" ON "spree_roles_users" ("role_id");
CREATE INDEX "index_spree_roles_users_on_user_id" ON "spree_roles_users" ("user_id");
CREATE TABLE "spree_shipping_categories" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "spree_state_changes" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "previous_state" varchar(255), "stateful_id" integer, "user_id" integer, "stateful_type" varchar(255), "next_state" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "spree_states" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "abbr" varchar(255), "country_id" integer, "updated_at" datetime);
CREATE TABLE "spree_tax_categories" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "description" varchar(255), "is_default" boolean DEFAULT 'f', "deleted_at" datetime, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "spree_tax_rates" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "amount" decimal(8,5), "zone_id" integer, "tax_category_id" integer, "included_in_price" boolean DEFAULT 'f', "created_at" datetime, "updated_at" datetime, "name" varchar(255), "show_rate_in_label" boolean DEFAULT 't', "deleted_at" datetime);
CREATE TABLE "spree_taxonomies" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255) NOT NULL, "created_at" datetime, "updated_at" datetime, "position" integer DEFAULT 0);
CREATE TABLE "spree_taxons" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "parent_id" integer, "position" integer DEFAULT 0, "name" varchar(255) NOT NULL, "permalink" varchar(255), "taxonomy_id" integer, "lft" integer, "rgt" integer, "icon_file_name" varchar(255), "icon_content_type" varchar(255), "icon_file_size" integer, "icon_updated_at" datetime, "description" text, "created_at" datetime, "updated_at" datetime, "meta_title" varchar(255), "meta_description" varchar(255), "meta_keywords" varchar(255), "depth" integer);
CREATE INDEX "index_taxons_on_parent_id" ON "spree_taxons" ("parent_id");
CREATE INDEX "index_taxons_on_permalink" ON "spree_taxons" ("permalink");
CREATE INDEX "index_taxons_on_taxonomy_id" ON "spree_taxons" ("taxonomy_id");
CREATE TABLE "spree_tokenized_permissions" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "permissable_id" integer, "permissable_type" varchar(255), "token" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE INDEX "index_tokenized_name_and_type" ON "spree_tokenized_permissions" ("permissable_id", "permissable_type");
CREATE TABLE "spree_trackers" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "environment" varchar(255), "analytics_id" varchar(255), "active" boolean DEFAULT 't', "created_at" datetime, "updated_at" datetime);
CREATE TABLE "spree_zone_members" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "zoneable_id" integer, "zoneable_type" varchar(255), "zone_id" integer, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "spree_zones" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "description" varchar(255), "default_tax" boolean DEFAULT 'f', "zone_members_count" integer DEFAULT 0, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "spree_products_promotion_rules" ("product_id" integer, "promotion_rule_id" integer);
CREATE INDEX "index_products_promotion_rules_on_product_id" ON "spree_products_promotion_rules" ("product_id");
CREATE INDEX "index_products_promotion_rules_on_promotion_rule_id" ON "spree_products_promotion_rules" ("promotion_rule_id");
CREATE TABLE "spree_promotion_action_line_items" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "promotion_action_id" integer, "variant_id" integer, "quantity" integer DEFAULT 1);
CREATE TABLE "spree_promotion_rules_users" ("user_id" integer, "promotion_rule_id" integer);
CREATE INDEX "index_promotion_rules_users_on_promotion_rule_id" ON "spree_promotion_rules_users" ("promotion_rule_id");
CREATE INDEX "index_promotion_rules_users_on_user_id" ON "spree_promotion_rules_users" ("user_id");
CREATE TABLE "spree_preferences" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "value" text, "key" varchar(255), "value_type" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE UNIQUE INDEX "index_spree_preferences_on_key" ON "spree_preferences" ("key");
CREATE TABLE "spree_prices" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "variant_id" integer NOT NULL, "amount" decimal(8,2), "currency" varchar(255), "deleted_at" datetime);
CREATE TABLE "spree_payment_methods" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "type" varchar(255), "name" varchar(255), "description" text, "active" boolean DEFAULT 't', "environment" varchar(255) DEFAULT 'development', "deleted_at" datetime, "created_at" datetime, "updated_at" datetime, "display_on" varchar(255), "auto_capture" boolean);
CREATE TABLE "spree_products_taxons" ("product_id" integer, "taxon_id" integer, "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "position" integer);
CREATE INDEX "index_spree_products_taxons_on_product_id" ON "spree_products_taxons" ("product_id");
CREATE INDEX "index_spree_products_taxons_on_taxon_id" ON "spree_products_taxons" ("taxon_id");
CREATE TABLE "spree_shipping_methods_zones" ("shipping_method_id" integer, "zone_id" integer);
CREATE TABLE "spree_shipping_method_categories" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "shipping_method_id" integer NOT NULL, "shipping_category_id" integer NOT NULL, "created_at" datetime, "updated_at" datetime);
CREATE INDEX "index_spree_shipping_method_categories_on_shipping_method_id" ON "spree_shipping_method_categories" ("shipping_method_id");
CREATE TABLE "spree_shipping_methods" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "display_on" varchar(255), "deleted_at" datetime, "created_at" datetime, "updated_at" datetime, "tracking_url" varchar(255), "admin_name" varchar(255), "tax_category_id" integer);
CREATE TABLE "spree_payments" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "amount" decimal(10,2) DEFAULT 0.0 NOT NULL, "order_id" integer, "source_id" integer, "source_type" varchar(255), "payment_method_id" integer, "state" varchar(255), "response_code" varchar(255), "avs_response" varchar(255), "created_at" datetime, "updated_at" datetime, "identifier" varchar(255), "cvv_response_code" varchar(255), "cvv_response_message" varchar(255), "uncaptured_amount" decimal(10,2) DEFAULT 0.0);
CREATE INDEX "index_spree_payments_on_order_id" ON "spree_payments" ("order_id");
CREATE TABLE "spree_return_authorizations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "number" varchar(255), "state" varchar(255), "amount" decimal(10,2) DEFAULT 0.0 NOT NULL, "order_id" integer, "reason" text, "created_at" datetime, "updated_at" datetime, "stock_location_id" integer);
CREATE TABLE "spree_stock_movements" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "stock_item_id" integer, "quantity" integer DEFAULT 0, "action" varchar(255), "created_at" datetime, "updated_at" datetime, "originator_id" integer, "originator_type" varchar(255));
CREATE INDEX "index_spree_stock_movements_on_stock_item_id" ON "spree_stock_movements" ("stock_item_id");
CREATE TABLE "spree_shipping_rates" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "shipment_id" integer, "shipping_method_id" integer, "selected" boolean DEFAULT 'f', "cost" decimal(8,2) DEFAULT 0, "created_at" datetime, "updated_at" datetime, "tax_rate_id" integer);
CREATE UNIQUE INDEX "spree_shipping_rates_join_index" ON "spree_shipping_rates" ("shipment_id", "shipping_method_id");
CREATE TABLE "spree_stock_transfers" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "type" varchar(255), "reference" varchar(255), "source_location_id" integer, "destination_location_id" integer, "created_at" datetime, "updated_at" datetime, "number" varchar(255));
CREATE INDEX "index_spree_stock_transfers_on_number" ON "spree_stock_transfers" ("number");
CREATE INDEX "index_spree_stock_transfers_on_source_location_id" ON "spree_stock_transfers" ("source_location_id");
CREATE INDEX "index_spree_stock_transfers_on_destination_location_id" ON "spree_stock_transfers" ("destination_location_id");
CREATE TABLE "spree_inventory_units" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "state" varchar(255), "variant_id" integer, "order_id" integer, "shipment_id" integer, "return_authorization_id" integer, "created_at" datetime, "updated_at" datetime, "pending" boolean DEFAULT 't', "line_item_id" integer);
CREATE INDEX "index_inventory_units_on_order_id" ON "spree_inventory_units" ("order_id");
CREATE INDEX "index_inventory_units_on_shipment_id" ON "spree_inventory_units" ("shipment_id");
CREATE INDEX "index_inventory_units_on_variant_id" ON "spree_inventory_units" ("variant_id");
CREATE TABLE "spree_stock_items" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "stock_location_id" integer, "variant_id" integer, "count_on_hand" integer DEFAULT 0 NOT NULL, "created_at" datetime, "updated_at" datetime, "backorderable" boolean DEFAULT 'f', "deleted_at" datetime);
CREATE INDEX "index_spree_stock_items_on_stock_location_id" ON "spree_stock_items" ("stock_location_id");
CREATE INDEX "stock_item_by_loc_and_var_id" ON "spree_stock_items" ("stock_location_id", "variant_id");
CREATE TABLE "spree_stock_locations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "created_at" datetime, "updated_at" datetime, "address1" varchar(255), "address2" varchar(255), "city" varchar(255), "state_id" integer, "state_name" varchar(255), "country_id" integer, "zipcode" varchar(255), "phone" varchar(255), "active" boolean DEFAULT 't', "backorderable_default" boolean DEFAULT 'f', "propagate_all_variants" boolean DEFAULT 't', "admin_name" varchar(255));
CREATE TABLE "spree_adjustments" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "source_id" integer, "source_type" varchar(255), "adjustable_id" integer, "adjustable_type" varchar(255), "amount" decimal(10,2), "label" varchar(255), "mandatory" boolean, "eligible" boolean DEFAULT 't', "created_at" datetime, "updated_at" datetime, "state" varchar(255), "order_id" integer, "included" boolean DEFAULT 'f');
CREATE INDEX "index_adjustments_on_order_id" ON "spree_adjustments" ("adjustable_id");
CREATE INDEX "index_spree_adjustments_on_source_type_and_source_id" ON "spree_adjustments" ("source_type", "source_id");
CREATE TABLE "spree_countries" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "iso_name" varchar(255), "iso" varchar(255), "iso3" varchar(255), "name" varchar(255), "numcode" integer, "states_required" boolean DEFAULT 'f', "updated_at" datetime);
CREATE TABLE "spree_promotions" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "description" varchar(255), "expires_at" datetime, "starts_at" datetime, "name" varchar(255), "type" varchar(255), "usage_limit" integer, "match_policy" varchar(255) DEFAULT 'all', "code" varchar(255), "advertise" boolean DEFAULT 'f', "path" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "spree_credit_cards" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "month" varchar(255), "year" varchar(255), "cc_type" varchar(255), "last_digits" varchar(255), "first_name" varchar(255), "last_name" varchar(255), "address_id" integer, "gateway_customer_profile_id" varchar(255), "gateway_payment_profile_id" varchar(255), "created_at" datetime, "updated_at" datetime, "name" varchar(255), "user_id" integer, "payment_method_id" integer);
CREATE TABLE "spree_line_items" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "variant_id" integer, "order_id" integer, "quantity" integer NOT NULL, "price" decimal(8,2) NOT NULL, "created_at" datetime, "updated_at" datetime, "currency" varchar(255), "cost_price" decimal(8,2), "tax_category_id" integer, "adjustment_total" decimal(10,2) DEFAULT 0.0, "additional_tax_total" decimal(10,2) DEFAULT 0.0, "promo_total" decimal(10,2) DEFAULT 0.0, "included_tax_total" decimal(10,2) DEFAULT 0.0 NOT NULL, "pre_tax_amount" decimal(8,2));
CREATE INDEX "index_spree_line_items_on_order_id" ON "spree_line_items" ("order_id");
CREATE INDEX "index_spree_line_items_on_variant_id" ON "spree_line_items" ("variant_id");
CREATE TABLE "spree_shipments" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "tracking" varchar(255), "number" varchar(255), "cost" decimal(8,2), "shipped_at" datetime, "order_id" integer, "address_id" integer, "state" varchar(255), "created_at" datetime, "updated_at" datetime, "stock_location_id" integer, "adjustment_total" decimal(10,2) DEFAULT 0.0, "additional_tax_total" decimal(10,2) DEFAULT 0.0, "promo_total" decimal(10,2) DEFAULT 0.0, "included_tax_total" decimal(10,2) DEFAULT 0.0 NOT NULL, "pre_tax_amount" decimal(8,2));
CREATE INDEX "index_shipments_on_number" ON "spree_shipments" ("number");
CREATE INDEX "index_spree_shipments_on_order_id" ON "spree_shipments" ("order_id");
CREATE TABLE "spree_orders" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "number" varchar(32), "item_total" decimal(10,2) DEFAULT 0.0 NOT NULL, "total" decimal(10,2) DEFAULT 0.0 NOT NULL, "state" varchar(255), "adjustment_total" decimal(10,2) DEFAULT 0.0 NOT NULL, "user_id" integer, "completed_at" datetime, "bill_address_id" integer, "ship_address_id" integer, "payment_total" decimal(10,2) DEFAULT 0.0, "shipping_method_id" integer, "shipment_state" varchar(255), "payment_state" varchar(255), "email" varchar(255), "special_instructions" text, "created_at" datetime, "updated_at" datetime, "currency" varchar(255), "last_ip_address" varchar(255), "created_by_id" integer, "shipment_total" decimal(10,2) DEFAULT 0.0 NOT NULL, "additional_tax_total" decimal(10,2) DEFAULT 0.0, "promo_total" decimal(10,2) DEFAULT 0.0, "channel" varchar(255) DEFAULT 'spree', "included_tax_total" decimal(10,2) DEFAULT 0.0 NOT NULL, "item_count" integer DEFAULT 0, "approver_id" integer, "approved_at" datetime, "confirmation_delivered" boolean DEFAULT 'f', "considered_risky" boolean DEFAULT 'f');
CREATE INDEX "index_spree_orders_on_number" ON "spree_orders" ("number");
CREATE INDEX "index_spree_orders_on_user_id" ON "spree_orders" ("user_id");
CREATE INDEX "index_spree_orders_on_completed_at" ON "spree_orders" ("completed_at");
CREATE INDEX "index_spree_inventory_units_on_line_item_id" ON "spree_inventory_units" ("line_item_id");
CREATE TABLE "spree_orders_promotions" ("order_id" integer, "promotion_id" integer);
CREATE UNIQUE INDEX "unique_spree_shipping_method_categories" ON "spree_shipping_method_categories" ("shipping_category_id", "shipping_method_id");
CREATE TABLE "spree_products" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255) DEFAULT '' NOT NULL, "description" text, "available_on" datetime, "deleted_at" datetime, "slug" varchar(255), "meta_description" text, "meta_keywords" varchar(255), "tax_category_id" integer, "shipping_category_id" integer, "created_at" datetime, "updated_at" datetime);
CREATE INDEX "index_spree_products_on_available_on" ON "spree_products" ("available_on");
CREATE INDEX "index_spree_products_on_deleted_at" ON "spree_products" ("deleted_at");
CREATE INDEX "index_spree_products_on_name" ON "spree_products" ("name");
CREATE UNIQUE INDEX "permalink_idx_unique" ON "spree_products" ("slug");
CREATE INDEX "index_spree_products_on_slug" ON "spree_products" ("slug");
CREATE INDEX "index_spree_prices_on_variant_id_and_currency" ON "spree_prices" ("variant_id", "currency");
CREATE TABLE "spree_promotion_rules" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "promotion_id" integer, "user_id" integer, "product_group_id" integer, "type" varchar(255), "created_at" datetime, "updated_at" datetime, "code" varchar(255));
CREATE INDEX "index_promotion_rules_on_product_group_id" ON "spree_promotion_rules" ("product_group_id");
CREATE INDEX "index_promotion_rules_on_user_id" ON "spree_promotion_rules" ("user_id");
CREATE TABLE "spree_promotion_actions" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "promotion_id" integer, "position" integer, "type" varchar(255));
CREATE TABLE "spree_payment_capture_events" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "amount" decimal(10,2) DEFAULT 0.0, "payment_id" integer, "created_at" datetime, "updated_at" datetime);
CREATE INDEX "index_spree_payment_capture_events_on_payment_id" ON "spree_payment_capture_events" ("payment_id");
CREATE TABLE "spree_variants" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "sku" varchar(255) DEFAULT '' NOT NULL, "weight" decimal(8,2) DEFAULT 0.0, "height" decimal(8,2), "width" decimal(8,2), "depth" decimal(8,2), "deleted_at" datetime, "is_master" boolean DEFAULT 'f', "product_id" integer, "cost_price" decimal(8,2), "position" integer, "cost_currency" varchar(255), "track_inventory" boolean DEFAULT 't', "tax_category_id" integer, "updated_at" datetime);
CREATE INDEX "index_spree_variants_on_product_id" ON "spree_variants" ("product_id");
CREATE INDEX "index_spree_variants_on_sku" ON "spree_variants" ("sku");
CREATE INDEX "index_spree_variants_on_tax_category_id" ON "spree_variants" ("tax_category_id");
CREATE INDEX "index_spree_payment_methods_on_id_and_type" ON "spree_payment_methods" ("id", "type");
CREATE INDEX "index_spree_calculators_on_id_and_type" ON "spree_calculators" ("id", "type");
CREATE INDEX "index_spree_calculators_on_calculable_id_and_calculable_type" ON "spree_calculators" ("calculable_id", "calculable_type");
CREATE INDEX "index_spree_payments_on_payment_method_id" ON "spree_payments" ("payment_method_id");
CREATE INDEX "index_spree_promotion_actions_on_id_and_type" ON "spree_promotion_actions" ("id", "type");
CREATE INDEX "index_spree_promotion_actions_on_promotion_id" ON "spree_promotion_actions" ("promotion_id");
CREATE INDEX "index_spree_promotions_on_id_and_type" ON "spree_promotions" ("id", "type");
CREATE INDEX "index_spree_option_values_on_option_type_id" ON "spree_option_values" ("option_type_id");
CREATE INDEX "index_spree_shipments_on_stock_location_id" ON "spree_shipments" ("stock_location_id");
CREATE INDEX "index_spree_credit_cards_on_user_id" ON "spree_credit_cards" ("user_id");
CREATE INDEX "index_spree_credit_cards_on_payment_method_id" ON "spree_credit_cards" ("payment_method_id");
CREATE TABLE "spree_skrill_transactions" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar(255), "amount" float, "currency" varchar(255), "transaction_id" integer, "customer_id" integer, "payment_type" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "spree_users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "encrypted_password" varchar(128), "password_salt" varchar(128), "email" varchar(255), "remember_token" varchar(255), "persistence_token" varchar(255), "reset_password_token" varchar(255), "perishable_token" varchar(255), "sign_in_count" integer DEFAULT 0 NOT NULL, "failed_attempts" integer DEFAULT 0 NOT NULL, "last_request_at" datetime, "current_sign_in_at" datetime, "last_sign_in_at" datetime, "current_sign_in_ip" varchar(255), "last_sign_in_ip" varchar(255), "login" varchar(255), "ship_address_id" integer, "bill_address_id" integer, "authentication_token" varchar(255), "unlock_token" varchar(255), "locked_at" datetime, "reset_password_sent_at" datetime, "created_at" datetime, "updated_at" datetime, "spree_api_key" varchar(48), "remember_created_at" datetime);
CREATE INDEX "index_spree_users_on_spree_api_key" ON "spree_users" ("spree_api_key");
CREATE UNIQUE INDEX "email_idx_unique" ON "spree_users" ("email");
CREATE INDEX "index_spree_orders_on_user_id_and_created_by_id" ON "spree_orders" ("user_id", "created_by_id");
CREATE TABLE "spree_product_translations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "spree_product_id" integer, "locale" varchar(255), "created_at" datetime, "updated_at" datetime, "name" varchar(255), "description" text, "meta_description" varchar(255), "meta_keywords" varchar(255), "slug" varchar(255));
CREATE INDEX "index_spree_product_translations_on_spree_product_id" ON "spree_product_translations" ("spree_product_id");
CREATE INDEX "index_spree_product_translations_on_locale" ON "spree_product_translations" ("locale");
CREATE TABLE "spree_promotion_translations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "spree_promotion_id" integer, "locale" varchar(255), "created_at" datetime, "updated_at" datetime, "name" varchar(255), "description" varchar(255));
CREATE INDEX "index_spree_promotion_translations_on_spree_promotion_id" ON "spree_promotion_translations" ("spree_promotion_id");
CREATE INDEX "index_spree_promotion_translations_on_locale" ON "spree_promotion_translations" ("locale");
CREATE TABLE "spree_option_type_translations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "spree_option_type_id" integer, "locale" varchar(255), "created_at" datetime, "updated_at" datetime, "name" varchar(255), "presentation" varchar(255));
CREATE INDEX "index_spree_option_type_translations_on_spree_option_type_id" ON "spree_option_type_translations" ("spree_option_type_id");
CREATE INDEX "index_spree_option_type_translations_on_locale" ON "spree_option_type_translations" ("locale");
CREATE TABLE "spree_property_translations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "spree_property_id" integer, "locale" varchar(255), "created_at" datetime, "updated_at" datetime, "name" varchar(255), "presentation" varchar(255));
CREATE INDEX "index_spree_property_translations_on_spree_property_id" ON "spree_property_translations" ("spree_property_id");
CREATE INDEX "index_spree_property_translations_on_locale" ON "spree_property_translations" ("locale");
CREATE TABLE "spree_taxonomy_translations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "spree_taxonomy_id" integer, "locale" varchar(255), "created_at" datetime, "updated_at" datetime, "name" varchar(255));
CREATE INDEX "index_spree_taxonomy_translations_on_spree_taxonomy_id" ON "spree_taxonomy_translations" ("spree_taxonomy_id");
CREATE INDEX "index_spree_taxonomy_translations_on_locale" ON "spree_taxonomy_translations" ("locale");
CREATE TABLE "spree_taxon_translations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "spree_taxon_id" integer, "locale" varchar(255), "created_at" datetime, "updated_at" datetime, "name" varchar(255), "description" text, "meta_title" varchar(255), "meta_description" varchar(255), "meta_keywords" varchar(255), "permalink" varchar(255));
CREATE INDEX "index_spree_taxon_translations_on_spree_taxon_id" ON "spree_taxon_translations" ("spree_taxon_id");
CREATE INDEX "index_spree_taxon_translations_on_locale" ON "spree_taxon_translations" ("locale");
CREATE TABLE "spree_option_value_translations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "spree_option_value_id" integer, "locale" varchar(255), "created_at" datetime, "updated_at" datetime, "name" varchar(255), "presentation" varchar(255));
CREATE INDEX "index_spree_option_value_translations_on_spree_option_value_id" ON "spree_option_value_translations" ("spree_option_value_id");
CREATE INDEX "index_spree_option_value_translations_on_locale" ON "spree_option_value_translations" ("locale");
INSERT INTO schema_migrations (version) VALUES ('20140509195820');

INSERT INTO schema_migrations (version) VALUES ('20140509195821');

INSERT INTO schema_migrations (version) VALUES ('20140509195822');

INSERT INTO schema_migrations (version) VALUES ('20140509195823');

INSERT INTO schema_migrations (version) VALUES ('20140509195824');

INSERT INTO schema_migrations (version) VALUES ('20140509195825');

INSERT INTO schema_migrations (version) VALUES ('20140509195826');

INSERT INTO schema_migrations (version) VALUES ('20140509195827');

INSERT INTO schema_migrations (version) VALUES ('20140509195828');

INSERT INTO schema_migrations (version) VALUES ('20140509195829');

INSERT INTO schema_migrations (version) VALUES ('20140509195830');

INSERT INTO schema_migrations (version) VALUES ('20140509195831');

INSERT INTO schema_migrations (version) VALUES ('20140509195832');

INSERT INTO schema_migrations (version) VALUES ('20140509195833');

INSERT INTO schema_migrations (version) VALUES ('20140509195834');

INSERT INTO schema_migrations (version) VALUES ('20140509195835');

INSERT INTO schema_migrations (version) VALUES ('20140509195836');

INSERT INTO schema_migrations (version) VALUES ('20140509195837');

INSERT INTO schema_migrations (version) VALUES ('20140509195838');

INSERT INTO schema_migrations (version) VALUES ('20140509195839');

INSERT INTO schema_migrations (version) VALUES ('20140509195840');

INSERT INTO schema_migrations (version) VALUES ('20140509195841');

INSERT INTO schema_migrations (version) VALUES ('20140509195842');

INSERT INTO schema_migrations (version) VALUES ('20140509195843');

INSERT INTO schema_migrations (version) VALUES ('20140509195844');

INSERT INTO schema_migrations (version) VALUES ('20140509195845');

INSERT INTO schema_migrations (version) VALUES ('20140509195846');

INSERT INTO schema_migrations (version) VALUES ('20140509195847');

INSERT INTO schema_migrations (version) VALUES ('20140509195848');

INSERT INTO schema_migrations (version) VALUES ('20140509195849');

INSERT INTO schema_migrations (version) VALUES ('20140509195850');

INSERT INTO schema_migrations (version) VALUES ('20140509195851');

INSERT INTO schema_migrations (version) VALUES ('20140509195852');

INSERT INTO schema_migrations (version) VALUES ('20140509195853');

INSERT INTO schema_migrations (version) VALUES ('20140509195854');

INSERT INTO schema_migrations (version) VALUES ('20140509195855');

INSERT INTO schema_migrations (version) VALUES ('20140509195856');

INSERT INTO schema_migrations (version) VALUES ('20140509195857');

INSERT INTO schema_migrations (version) VALUES ('20140509195858');

INSERT INTO schema_migrations (version) VALUES ('20140509195859');

INSERT INTO schema_migrations (version) VALUES ('20140509195860');

INSERT INTO schema_migrations (version) VALUES ('20140509195861');

INSERT INTO schema_migrations (version) VALUES ('20140509195862');

INSERT INTO schema_migrations (version) VALUES ('20140509195863');

INSERT INTO schema_migrations (version) VALUES ('20140509195864');

INSERT INTO schema_migrations (version) VALUES ('20140509195865');

INSERT INTO schema_migrations (version) VALUES ('20140509195866');

INSERT INTO schema_migrations (version) VALUES ('20140509195867');

INSERT INTO schema_migrations (version) VALUES ('20140509195868');

INSERT INTO schema_migrations (version) VALUES ('20140509195869');

INSERT INTO schema_migrations (version) VALUES ('20140509195870');

INSERT INTO schema_migrations (version) VALUES ('20140509195871');

INSERT INTO schema_migrations (version) VALUES ('20140509195872');

INSERT INTO schema_migrations (version) VALUES ('20140509195873');

INSERT INTO schema_migrations (version) VALUES ('20140509195874');

INSERT INTO schema_migrations (version) VALUES ('20140509195875');

INSERT INTO schema_migrations (version) VALUES ('20140509195876');

INSERT INTO schema_migrations (version) VALUES ('20140509195877');

INSERT INTO schema_migrations (version) VALUES ('20140509195878');

INSERT INTO schema_migrations (version) VALUES ('20140509195879');

INSERT INTO schema_migrations (version) VALUES ('20140509195880');

INSERT INTO schema_migrations (version) VALUES ('20140509195881');

INSERT INTO schema_migrations (version) VALUES ('20140509195882');

INSERT INTO schema_migrations (version) VALUES ('20140509195883');

INSERT INTO schema_migrations (version) VALUES ('20140509195884');

INSERT INTO schema_migrations (version) VALUES ('20140509195885');

INSERT INTO schema_migrations (version) VALUES ('20140509195886');

INSERT INTO schema_migrations (version) VALUES ('20140509195887');

INSERT INTO schema_migrations (version) VALUES ('20140509195888');

INSERT INTO schema_migrations (version) VALUES ('20140509195889');

INSERT INTO schema_migrations (version) VALUES ('20140509195890');

INSERT INTO schema_migrations (version) VALUES ('20140509195891');

INSERT INTO schema_migrations (version) VALUES ('20140509195892');

INSERT INTO schema_migrations (version) VALUES ('20140509195893');

INSERT INTO schema_migrations (version) VALUES ('20140509195894');

INSERT INTO schema_migrations (version) VALUES ('20140509195895');

INSERT INTO schema_migrations (version) VALUES ('20140509195896');

INSERT INTO schema_migrations (version) VALUES ('20140509195897');

INSERT INTO schema_migrations (version) VALUES ('20140509195898');

INSERT INTO schema_migrations (version) VALUES ('20140509195899');

INSERT INTO schema_migrations (version) VALUES ('20140509195900');

INSERT INTO schema_migrations (version) VALUES ('20140509195901');

INSERT INTO schema_migrations (version) VALUES ('20140509195902');

INSERT INTO schema_migrations (version) VALUES ('20140509195903');

INSERT INTO schema_migrations (version) VALUES ('20140509195904');

INSERT INTO schema_migrations (version) VALUES ('20140509195905');

INSERT INTO schema_migrations (version) VALUES ('20140509195906');

INSERT INTO schema_migrations (version) VALUES ('20140509195907');

INSERT INTO schema_migrations (version) VALUES ('20140509195908');

INSERT INTO schema_migrations (version) VALUES ('20140509195909');

INSERT INTO schema_migrations (version) VALUES ('20140509195910');

INSERT INTO schema_migrations (version) VALUES ('20140509195911');

INSERT INTO schema_migrations (version) VALUES ('20140509195912');

INSERT INTO schema_migrations (version) VALUES ('20140509195913');

INSERT INTO schema_migrations (version) VALUES ('20140509195914');

INSERT INTO schema_migrations (version) VALUES ('20140509195915');

INSERT INTO schema_migrations (version) VALUES ('20140509195916');

INSERT INTO schema_migrations (version) VALUES ('20140509195917');

INSERT INTO schema_migrations (version) VALUES ('20140509195918');

INSERT INTO schema_migrations (version) VALUES ('20140509195919');

INSERT INTO schema_migrations (version) VALUES ('20140509195920');

INSERT INTO schema_migrations (version) VALUES ('20140509195921');

INSERT INTO schema_migrations (version) VALUES ('20140509195922');

INSERT INTO schema_migrations (version) VALUES ('20140509195923');

INSERT INTO schema_migrations (version) VALUES ('20140509195924');

INSERT INTO schema_migrations (version) VALUES ('20140509195925');

INSERT INTO schema_migrations (version) VALUES ('20140509195926');

INSERT INTO schema_migrations (version) VALUES ('20140509195927');

INSERT INTO schema_migrations (version) VALUES ('20140509195928');

INSERT INTO schema_migrations (version) VALUES ('20140509195929');

INSERT INTO schema_migrations (version) VALUES ('20140509195930');

INSERT INTO schema_migrations (version) VALUES ('20140509195931');

INSERT INTO schema_migrations (version) VALUES ('20140509195932');

INSERT INTO schema_migrations (version) VALUES ('20140509195933');

INSERT INTO schema_migrations (version) VALUES ('20140509195934');

INSERT INTO schema_migrations (version) VALUES ('20140509195935');

INSERT INTO schema_migrations (version) VALUES ('20140509195936');

INSERT INTO schema_migrations (version) VALUES ('20140509195937');

INSERT INTO schema_migrations (version) VALUES ('20140509195938');

INSERT INTO schema_migrations (version) VALUES ('20140509195939');

INSERT INTO schema_migrations (version) VALUES ('20140509195940');

INSERT INTO schema_migrations (version) VALUES ('20140509195941');

INSERT INTO schema_migrations (version) VALUES ('20140509195942');

INSERT INTO schema_migrations (version) VALUES ('20140509195943');

INSERT INTO schema_migrations (version) VALUES ('20140509195944');

INSERT INTO schema_migrations (version) VALUES ('20140509195945');

INSERT INTO schema_migrations (version) VALUES ('20140509195946');

INSERT INTO schema_migrations (version) VALUES ('20140509195947');

INSERT INTO schema_migrations (version) VALUES ('20140509195948');

INSERT INTO schema_migrations (version) VALUES ('20140509195949');

INSERT INTO schema_migrations (version) VALUES ('20140509195950');

INSERT INTO schema_migrations (version) VALUES ('20140509195951');

INSERT INTO schema_migrations (version) VALUES ('20140509195952');

INSERT INTO schema_migrations (version) VALUES ('20140509195953');

INSERT INTO schema_migrations (version) VALUES ('20140509195954');

INSERT INTO schema_migrations (version) VALUES ('20140509195955');

INSERT INTO schema_migrations (version) VALUES ('20140509195956');

INSERT INTO schema_migrations (version) VALUES ('20140509195957');

INSERT INTO schema_migrations (version) VALUES ('20140509195958');

INSERT INTO schema_migrations (version) VALUES ('20140509195959');

INSERT INTO schema_migrations (version) VALUES ('20140509195960');

INSERT INTO schema_migrations (version) VALUES ('20140509195961');

INSERT INTO schema_migrations (version) VALUES ('20140509195962');

INSERT INTO schema_migrations (version) VALUES ('20140509195963');

INSERT INTO schema_migrations (version) VALUES ('20140510181246');

INSERT INTO schema_migrations (version) VALUES ('20140510182319');

INSERT INTO schema_migrations (version) VALUES ('20140510182320');

INSERT INTO schema_migrations (version) VALUES ('20140510182321');

INSERT INTO schema_migrations (version) VALUES ('20140510182322');

INSERT INTO schema_migrations (version) VALUES ('20140510182323');
