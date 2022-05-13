class Report
  def initialize
    @file = File.open('products_after_30_days.txt', 'w')
  end

  def print_report(products, day)
    @file.puts "-------- day #{day} --------"
    @file.puts 'name, sellIn, price'
    products.each do |product|
      @file.puts "#{product.name}, #{product.sell_in}, #{product.price}"
    end
    @file.puts ''
  end
end
