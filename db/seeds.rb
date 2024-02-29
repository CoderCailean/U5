require "csv"

bad_product = Product.create(title: "Test")

if not(bad_product.valid?)
  bad_product.errors.messages.each do |column, errors|
    errors.each do |error|
      puts "The #{column} property #{error}"
    end
  end
end

Product.delete_all

# 676.times do
#   new_product = Product.create(
#     title: Faker::Commerce.product_name,
#     price: Faker::Commerce.price,
#     stock_quantity: Faker::Number.between(from: 1, to: 100))
# end

filename = Rails.root.join("db/products.csv")

puts "Loading products from the CSV file: #{filename}"

csv_data = File.read(filename)
products = CSV.parse(csv_data, headers: true, encoding: "utf-8")

products.each do |product|
  category = Category.find_or_create_by(name: product["category"])

  if category && category.valid?
    product = category.products.create(
      title: product["name"],
      price: product["price"],
      stock_quantity: product["stock quantity"],
      description: product["description"],
    )
  end
end

puts "Created #{Product.count} products."