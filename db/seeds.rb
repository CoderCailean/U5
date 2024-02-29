bad_product = Product.create(title: "Test")

if not(bad_product.valid?)
  bad_product.errors.messages.each do |column, errors|
    errors.each do |error|
      puts "The #{column} property #{error}"
    end
  end
end