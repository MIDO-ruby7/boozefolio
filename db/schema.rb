# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_230_703_040_108) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'action_text_rich_texts', force: :cascade do |t|
    t.string 'name', null: false
    t.text 'body'
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[record_type record_id name], name: 'index_action_text_rich_texts_uniqueness', unique: true
  end

  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness',
                                                    unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.string 'service_name', null: false
    t.bigint 'byte_size', null: false
    t.string 'checksum'
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'active_storage_variant_records', force: :cascade do |t|
    t.bigint 'blob_id', null: false
    t.string 'variation_digest', null: false
    t.index %w[blob_id variation_digest], name: 'index_active_storage_variant_records_uniqueness', unique: true
  end

  create_table 'beers', force: :cascade do |t|
    t.string 'name', null: false
    t.float 'alcohol_content'
    t.bigint 'brewery_id'
    t.text 'note'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['brewery_id'], name: 'index_beers_on_brewery_id'
  end

  create_table 'breweries', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'state'
    t.integer 'country_of_origin'
    t.text 'website'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'categories', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'collections', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'item_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['item_id'], name: 'index_collections_on_item_id'
    t.index ['user_id'], name: 'index_collections_on_user_id'
  end

  create_table 'items', force: :cascade do |t|
    t.string 'name', null: false
    t.integer 'size'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'user_id'
    t.integer 'category_id'
    t.string 'maker'
    t.float 'alcohol_content'
    t.string 'region'
    t.text 'link'
    t.integer 'country_of_origin', default: 392
    t.index ['name'], name: 'index_items_on_name', unique: true
    t.index ['user_id'], name: 'index_items_on_user_id'
  end

  create_table 'photos', force: :cascade do |t|
    t.bigint 'item_id'
    t.string 'image'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['item_id'], name: 'index_photos_on_item_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'name'
    t.index ['email'], name: 'index_users_on_email', unique: true
  end

  create_table 'versions', force: :cascade do |t|
    t.string 'item_type', null: false
    t.bigint 'item_id', null: false
    t.string 'event', null: false
    t.string 'whodunnit'
    t.text 'object'
    t.datetime 'created_at'
    t.text 'object_changes'
    t.index %w[item_type item_id], name: 'index_versions_on_item_type_and_item_id'
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'active_storage_variant_records', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'beers', 'breweries'
  add_foreign_key 'collections', 'items'
  add_foreign_key 'collections', 'users'
  add_foreign_key 'items', 'users'
  add_foreign_key 'photos', 'items'
end
