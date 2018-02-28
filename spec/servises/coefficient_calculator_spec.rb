# frozen_string_literal: true

require 'rails_helper'
require 'pry'

describe CoefficientCalculator do
  subject { described_class.new }

  describe '#coefficient_profit' do
    let(:price){ double(:price) }
    let(:item_hash) do
      { 'classid'    => '57939697',
        'instanceid' => '0',
        'hash_name'  => 'Omnishred the Defiant',
        'price'      => 2.8,
        'time'       => '1519496533',
        'id'         => '41787754' }
    end

    context 'when item is profit' do
      before do
        allow(subject).to receive(:price).and_return(price)
        allow(price).to receive(:get_price_of_sell).with(item_hash).and_return(10000)
        allow(price).to receive(:get_price_of_buy).with(item_hash).and_return(5000)
      end

      it 'returns 100' do
        expect(subject.coefficient_profit(item_hash)).to eq(100)
      end
    end

    context 'when item is not profit' do
      before do
        allow(subject).to receive(:price).and_return(price)
        allow(price).to receive(:get_price_of_sell).with(item_hash).and_return(10000)
        allow(price).to receive(:get_price_of_buy).with(item_hash).and_return(5000)
      end

      it 'returns 0' do
        expect(subject.coefficient_profit(item_hash)).to eq(0)
      end
    end
  end
end
