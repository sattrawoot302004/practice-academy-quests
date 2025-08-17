# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# ลบข้อมูลเดิมก่อน (ถ้าต้องการ)
Task.destroy_all

# สร้าง tasks ตัวอย่าง
Task.create!([
  { title: "Learn Ruby on Rails", completed: true },
  { title: "Build a To-Do App", completed: false },
  { title: "Write RSpec tests", completed: false },
  { title: "Deploy to production", completed: false }
])

puts "Seeded #{Task.count} tasks."
