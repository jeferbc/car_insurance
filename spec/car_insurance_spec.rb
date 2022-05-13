require_relative '../car_insurance/car_insurance.rb'
require 'simplecov'
SimpleCov.start

RSpec.describe CarInsurance do
  let!(:product) { Struct.new(:name, :sell_in, :price) }

  before { @prod = described_class.new([insurance]).update_price.first }

  context 'When low or medium insurance' do
    context 'when sell in greater or equal to zero' do
      let!(:insurance) { product.new('Medium Coverage', 1, 10) }

      it 'updates price' do
        expect(@prod.price).to eq 9
        expect(@prod.sell_in).to eq(0)
      end
    end

    context 'when sell in is less than zero' do
      let!(:insurance) { product.new('Medium Coverage', -1, 10) }

      it 'updates price' do
        expect(@prod.price).to eq 8
        expect(@prod.sell_in).to eq(-2)
      end
    end

    context 'when price is zero' do
      let!(:insurance) { product.new('Medium Coverage', -1, 0) }

      it 'updates price' do
        expect(@prod.price).to eq 0
        expect(@prod.sell_in).to eq(-2)
      end
    end
  end

  context 'When Full Coverage' do
    context 'when sell in greater or equal to zero' do
      let!(:insurance) { product.new('Full Coverage', 1, 10) }

      it 'updates price' do
        expect(@prod.price).to eq 11
        expect(@prod.sell_in).to eq(0)
      end
    end

    context 'when sell in is less than zero' do
      let!(:insurance) { product.new('Full Coverage', -1, 10) }

      it 'updates price' do
        expect(@prod.price).to eq 12
        expect(@prod.sell_in).to eq(-2)
      end
    end

    context 'when price is 50' do
      let!(:insurance) { product.new('Full Coverage', -1, 49) }

      it 'updates price' do
        expect(@prod.price).to eq 50
        expect(@prod.sell_in).to eq(-2)
      end
    end
  end

  context 'when Special Full Coverage' do
    context 'when sell in greater than 10' do
      let!(:insurance) { product.new('Special Full Coverage', 11, 10) }

      it 'updates price' do
        expect(@prod.price).to eq 11
        expect(@prod.sell_in).to eq(10)
      end
    end

    context 'when sell in less than 10 and greater than 5' do
      let!(:insurance) { product.new('Special Full Coverage', 9, 10) }

      it 'updates price' do
        expect(@prod.price).to eq 12
        expect(@prod.sell_in).to eq(8)
      end
    end

    context 'when sell in less than 5 and greater than 0' do
      let!(:insurance) { product.new('Special Full Coverage', 4, 10) }

      it 'updates price' do
        expect(@prod.price).to eq 13
        expect(@prod.sell_in).to eq(3)
      end
    end

    context 'when sell in is 0' do
      let!(:insurance) { product.new('Special Full Coverage', 0, 50) }

      it 'updates price' do
        expect(@prod.price).to eq 0
        expect(@prod.sell_in).to eq(-1)
      end
    end

    context 'when price is 50' do
      let!(:insurance) { product.new('Special Full Coverage', 10, 49) }

      it 'updates price' do
        expect(@prod.price).to eq 50
        expect(@prod.sell_in).to eq(9)
      end
    end
  end

  context 'Mega Coverage' do
    context 'when sell in greater or equal to zero' do
      let!(:insurance) { product.new('Mega Coverage', 0, 80) }

      it 'not update' do
        expect(@prod.price).to eq 80
        expect(@prod.sell_in).to eq(0)
      end
    end

    context 'when sell in is less than zero' do
      let!(:insurance) { product.new('Mega Coverage', -1, 80) }

      it 'not update' do
        expect(@prod.price).to eq 80
        expect(@prod.sell_in).to eq(-1)
      end
    end
  end

  context 'Super Sale' do
    context 'when sell in greater or equal to zero' do
      let!(:insurance) { product.new('Super Sale', 1, 10) }

      it 'updates price' do
        expect(@prod.price).to eq 8
        expect(@prod.sell_in).to eq(0)
      end
    end

    context 'when sell in is less than zero' do
      let!(:insurance) { product.new('Super Sale', -1, 10) }

      it 'updates price' do
        expect(@prod.price).to eq 6
        expect(@prod.sell_in).to eq(-2)
      end
    end

    context 'when price is zero' do
      let!(:insurance) { product.new('Super Sale', -1, 1) }

      it 'updates price' do
        expect(@prod.price).to eq 0
        expect(@prod.sell_in).to eq(-2)
      end
    end
  end
end
