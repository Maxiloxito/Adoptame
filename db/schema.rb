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

ActiveRecord::Schema[7.0].define(version: 2023_12_02_012529) do
  create_table "adopcions", force: :cascade do |t|
    t.integer "usuario_id", null: false
    t.integer "animal_id", null: false
    t.datetime "fecha"
    t.string "estado"
    t.text "razon"
    t.text "experiencia"
    t.string "imagen_previa_mascota"
    t.boolean "compromiso_cuidado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "correo"
    t.string "numero_contacto"
    t.index ["animal_id"], name: "index_adopcions_on_animal_id"
    t.index ["usuario_id"], name: "index_adopcions_on_usuario_id"
  end

  create_table "animals", force: :cascade do |t|
    t.string "nombre"
    t.string "raza"
    t.integer "edad_age"
    t.integer "edad_month"
    t.string "color"
    t.string "tipo_animal"
    t.integer "id_organizacion"
    t.string "descripcion"
    t.string "comportamiento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fotos", force: :cascade do |t|
    t.integer "animal_id", null: false
    t.string "imagen"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["animal_id"], name: "index_fotos_on_animal_id"
  end

  create_table "organizacions", force: :cascade do |t|
    t.string "nombre"
    t.string "direccion"
    t.string "numero_contacto"
    t.string "logo"
    t.text "colectas_asociadas"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "correo"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido"
    t.integer "edad"
    t.string "correo"
    t.string "numero_contacto"
    t.string "oficio"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "adopcions", "animals"
  add_foreign_key "adopcions", "usuarios"
  add_foreign_key "fotos", "animals"
end
