bad_product = Product.create(title: "Test")

if not(bad_product.valid?)
  bad_product.errors.messages.each do |column, errors|
    errors.each do |error|
      puts "The #{column} property #{error}"
    end
  end
end

Product.delete_all

676.times do
  new_product = Product.create(
    title: Faker::Commerce.product_name,
    price: Faker::Commerce.price,
    stock_quantity: Faker::Number.between(from: 1, to: 100))
end