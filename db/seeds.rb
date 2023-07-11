require 'csv'

CSV.foreach('db/csv/breweries.csv', headers: true) do |row|
  Content.create(
    name: row['name'],
    state: row['state'],
    country_of_origin: row['country'],
    website: row['website']
  )
end

CSV.foreach('db/csv/beers.csv', headers: true) do |row|
  Content.create(
    name: row['name'],
end
