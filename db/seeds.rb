# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
list = List.create title: 'Lista 0', slug: 'lista-0'

3.times do |t|
  SimpleTask.create list: list, description: "Simple Task numero: #{t}", priority: 'high', state: 'pending'
  LongTask.create list: list, description: "LongTask Task numero: #{t}", priority: 'low', state: 'pending'
  TempTask.create list: list, description: "TempTask numero: #{t}", start_date: Date.today - 2, end_date: Date.today + 40, priority: 'medium', state: 'pending'
end
