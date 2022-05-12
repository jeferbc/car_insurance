class CarInsurance
  def initialize(products)
    @products = products
  end

  def update_price
    @products.each do |product|
      update_product_sell_in(product)
      update_product_price(product)
    end

    @products
  end

  private

  def update_product_sell_in(product)
    return if product.name == 'Mega Coverage'

    product.sell_in -= 1
  end

  def update_product_price(product)
    case product.name
    when 'Full Coverage' then full_coverage_product(product)
    when 'Special Full Coverage' then special_full_coverage_product(product)
    when 'Mega Coverage' then product
    when 'Super Sale' then super_sale_coverage(product)
    else
      medium_or_low_coverage(product)
    end
  end

  def full_coverage_product(product)
    product.price += product.sell_in.negative? ? 2 : 1
    validate_greater_than_50(product)
  end

  def special_full_coverage_product(product)
    return product.price = 0 unless product.sell_in.positive?
    return product.price = 50 if product.price >= 50

    product.price += if product.sell_in >= 10
                       1
                     elsif product.sell_in < 10 && product.sell_in > 5
                       2
                     else
                       3
                     end
    validate_greater_than_50(product)
  end

  def super_sale_coverage(product)
    product.price -= product.sell_in.negative? ? 4 : 2
    validate_zero_price(product)
  end

  def medium_or_low_coverage(product)
    product.price -= product.sell_in.negative? ? 2 : 1
    validate_zero_price(product)
  end

  def validate_zero_price(product)
    product.price = 0 if product.price.negative?
  end

  def validate_greater_than_50(product)
    product.price = 50 if product.price > 50
  end
end
