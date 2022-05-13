require_relative './car_insurance/car_insurance.rb'
require_relative './reports/report.rb'

class InsuranceAfterDaysReport
  def initialize
    @product = Struct.new(:name, :sell_in, :price)
    @products_at_day_zero = [
      @product.new('Medium Coverage', 10, 20),
      @product.new('Full Coverage', 2, 0),
      @product.new('Low Coverage', 5, 7),
      @product.new('Mega Coverage', 0, 80),
      @product.new('Mega Coverage', -1, 80),
      @product.new('Special Full Coverage', 15, 20),
      @product.new('Special Full Coverage', 10, 49),
      @product.new('Special Full Coverage', 5, 49),
      @product.new('Super Sale', 3, 6)
    ]
  end

  def generate_report(days = 30)
    car_insurance = CarInsurance.new(@products_at_day_zero)
    report = Report.new
    report.print_report(@products_at_day_zero, 0)
    days.times do |index|
      car_insurance.update_price
      report.print_report(@products_at_day_zero, index + 1)
    end
    report.close_file
  end
end

InsuranceAfterDaysReport.new.generate_report
