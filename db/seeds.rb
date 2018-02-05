# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

states = [
  { abbr: 'AK', name: 'Alaska', districts: 1 },
  { abbr: 'AL', name: 'Alabama', districts: 7 },
  { abbr: 'AR', name: 'Arkansas', districts: 4 },
  { abbr: 'AZ', name: 'Arizona', districts: 9 },
  { abbr: 'CA', name: 'California', districts: 53 },
  { abbr: 'CO', name: 'Colorado', districts: 7 },
  { abbr: 'CT', name: 'Connecticut', districts: 5 },
  { abbr: 'DE', name: 'Delaware', districts: 1 },
  { abbr: 'FL', name: 'Florida', districts: 27 },
  { abbr: 'GA', name: 'Georgia', districts: 14 },
  { abbr: 'HI', name: 'Hawaii', districts: 2 },
  { abbr: 'IA', name: 'Iowa', districts: 4 },
  { abbr: 'ID', name: 'Idaho', districts: 2 },
  { abbr: 'IL', name: 'Illinois', districts: 18 },
  { abbr: 'IN', name: 'Indiana', districts: 9 },
  { abbr: 'KS', name: 'Kansas', districts: 4 },
  { abbr: 'KY', name: 'Kentucky', districts: 6 },
  { abbr: 'LA', name: 'Louisiana', districts: 6 },
  { abbr: 'MA', name: 'Massachusetts', districts: 9 },
  { abbr: 'MD', name: 'Maryland', districts: 8 },
  { abbr: 'ME', name: 'Maine', districts: 2 },
  { abbr: 'MI', name: 'Michigan', districts: 14 },
  { abbr: 'MN', name: 'Minnesota', districts: 8 },
  { abbr: 'MO', name: 'Missouri', districts: 8 },
  { abbr: 'MS', name: 'Mississippi', districts: 4 },
  { abbr: 'MT', name: 'Montana', districts: 1 },
  { abbr: 'NC', name: 'North Carolina', districts: 13 },
  { abbr: 'ND', name: 'North Dakota', districts: 1 },
  { abbr: 'NE', name: 'Nebraska', districts: 3 },
  { abbr: 'NH', name: 'New Hampshire', districts: 2 },
  { abbr: 'NJ', name: 'New Jersey', districts: 12 },
  { abbr: 'NM', name: 'New Mexico', districts: 3 },
  { abbr: 'NV', name: 'Nevada', districts: 4 },
  { abbr: 'NY', name: 'New York', districts: 27 },
  { abbr: 'OH', name: 'Ohio', districts: 16 },
  { abbr: 'OK', name: 'Oklahoma', districts: 5 },
  { abbr: 'OR', name: 'Oregon', districts: 5 },
  { abbr: 'PA', name: 'Pennsylvania', districts: 18 },
  { abbr: 'RI', name: 'Rhode Island', districts: 2 },
  { abbr: 'SC', name: 'South Carolina', districts: 7 },
  { abbr: 'SD', name: 'South Dakota', districts: 1 },
  { abbr: 'TN', name: 'Tennessee', districts: 9 },
  { abbr: 'TX', name: 'Texas', districts: 36 },
  { abbr: 'UT', name: 'Utah', districts: 4 },
  { abbr: 'VA', name: 'Virginia', districts: 11 },
  { abbr: 'VT', name: 'Vermont', districts: 1 },
  { abbr: 'WA', name: 'Washington', districts: 10 },
  { abbr: 'WI', name: 'Wisconsin', districts: 8 },
  { abbr: 'WV', name: 'West Virginia', districts: 3 },
  { abbr: 'WY', name: 'Wyoming', districts: 1 }
]

states.each do |s|
  st = State.create!({ abbr: s[:abbr], name: s[:name] })
  i = 1
  num = s[:districts]
  while i <= num  do
    st.districts.create!(number: i)
    i +=1
  end
end
