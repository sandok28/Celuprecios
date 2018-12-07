# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20181202154709) do

  create_table "advertisements", force: :cascade do |t|
    t.string   "name"
    t.text     "body"
    t.string   "direccion"
    t.string   "url"
    t.string   "slogan"
    t.string   "ciudad"
    t.string   "state",              default: "desactivo"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.string   "phone",              default: "0"
  end

  create_table "articles", force: :cascade do |t|
    t.integer  "phone_id"
    t.integer  "user_id"
    t.integer  "precio",             default: 0
    t.integer  "precio_minimo",      default: 0
    t.integer  "estado_fisico",      default: 0
    t.integer  "estado_funcional",   default: 0
    t.string   "cambio",             default: "no"
    t.string   "caja",               default: "no"
    t.string   "garantia",           default: "no"
    t.string   "factura",            default: "no"
    t.string   "audifonos",          default: "no"
    t.string   "cargador",           default: "no"
    t.string   "efectivo",           default: "si"
    t.string   "vidriotemplado",     default: "no"
    t.string   "funda",              default: "no"
    t.string   "vendido",            default: "no"
    t.text     "comentario"
    t.text     "caracteristicas"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "foto1_file_name"
    t.string   "foto1_content_type"
    t.integer  "foto1_file_size"
    t.datetime "foto1_updated_at"
    t.string   "foto2_file_name"
    t.string   "foto2_content_type"
    t.integer  "foto2_file_size"
    t.datetime "foto2_updated_at"
    t.string   "foto3_file_name"
    t.string   "foto3_content_type"
    t.integer  "foto3_file_size"
    t.datetime "foto3_updated_at"
    t.string   "foto4_file_name"
    t.string   "foto4_content_type"
    t.integer  "foto4_file_size"
    t.datetime "foto4_updated_at"
    t.integer  "brand_id"
    t.string   "priority",           default: "normal"
    t.string   "celular"
    t.string   "operating_system"
    t.string   "screen_size"
    t.string   "front_camera"
    t.string   "back_camera"
    t.string   "ram"
    t.string   "internal_storage"
    t.integer  "city_id"
    t.index ["brand_id"], name: "index_articles_on_brand_id"
    t.index ["city_id"], name: "index_articles_on_city_id"
    t.index ["phone_id"], name: "index_articles_on_phone_id"
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "comentador"
    t.string   "like"
    t.text     "body"
    t.string   "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "phones", force: :cascade do |t|
    t.string   "name"
    t.integer  "brand_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_phones_on_brand_id"
  end

  create_table "publications", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "article_id"
    t.integer  "advertisement_id"
    t.text     "body"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["advertisement_id"], name: "index_publications_on_advertisement_id"
    t.index ["article_id"], name: "index_publications_on_article_id"
    t.index ["user_id"], name: "index_publications_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "article_id"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_questions_on_article_id"
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",        null: false
    t.string   "encrypted_password",     default: "",        null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,         null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.integer  "permission_level",       default: 1
    t.string   "facebook"
    t.string   "celular"
    t.string   "email_state",            default: "visible"
    t.string   "city"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
