# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140226125418) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "enderecos", force: true do |t|
    t.integer  "cep"
    t.string   "endereco"
    t.integer  "numero"
    t.string   "complemento"
    t.string   "tipo_endereco", limit: 1
    t.string   "bairro"
    t.string   "cidade"
    t.string   "estado"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "principal",     limit: 1
  end

  create_table "users", force: true do |t|
    t.string   "nome"
    t.string   "cpf"
    t.date     "data_nascimento"
    t.string   "sexo",               limit: 1
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.string   "receber_newsletter", limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sobrenome"
  end

end
