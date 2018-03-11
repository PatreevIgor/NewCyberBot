# frozen_string_literal: true

require 'rails_helper'
require 'json'
require 'uri'
require 'net/http'

describe Price do
  subject { described_class.new }
  before  { allow_any_instance_of(described_class).to receive(:item_history).and_return(item_history) }

  let(:item_history) do
    { 'success' => true,
      'max'     => 2900,
      'min'     => 1901,
      'average' => 2143,
      'number'  => 500,
      'history' => [{ 'l_price' => '2900', 'l_time' => '1519493997' },
                    { 'l_price' => '2143', 'l_time' => '1519493795' },
                    { 'l_price' => '1901', 'l_time' => '1519298298' }] }
  end

  let(:item_hash) do
    { 'classid'    => '57939697',
      'instanceid' => '0',
      'hash_name'  => 'Omnishred the Defiant',
      'price'      => 2.8,
      'time'       => '1519496533',
      'id'         => '41787754' }
  end

  describe '#max_price' do
    it 'returns max item price' do
      expect(subject.max_price(item_hash)).to eq(2900)
    end
  end

  describe '#middle_price' do
    it 'returns middle item price' do
      expect(subject.middle_price(item_hash)).to eq(2143)
    end
  end

  describe '#min_price' do
    it 'returns min item price' do
      expect(subject.min_price(item_hash)).to eq(1901)
    end
  end

  context '#price_of_sell / #price_of_buy methods' do
    let(:price_of_buy) do
      JSON.parse(Net::HTTP.get_response(URI.parse('https://market.dota2.net/api/BestBuyOffer/'\
      "57939697_0/?key=#{Rails.application.secrets.your_secret_key}")).body)['best_offer'].to_i
    end

    let(:price_of_sell) do
      JSON.parse(Net::HTTP.get_response(URI.parse('https://market.dota2.net/api/BestSellOffer/'\
      "57939697_0/?key=#{Rails.application.secrets.your_secret_key}")).body)['best_offer'].to_i
    end

    describe '#get_price_of_buy' do
      it 'returns price of buy item' do
        expect(subject.price_of_buy(item_hash)).to eq(price_of_buy)
      end
    end

    describe '#get_price_of_sell' do
      it 'returns price of sell item' do
        expect(subject.price_of_sell(item_hash)).to eq(price_of_sell)
      end
    end
  end

  context 'methods for calculating the difference' do
    describe '#diff_price_of_sell_and_min' do
      before { allow_any_instance_of(described_class).to receive(:price_of_sell).with(item_hash).and_return(2000) }

      it 'returns 99 (2000 - 1901)' do
        expect(subject.diff_price_of_sell_and_min(item_hash)).to eq(99)
      end
    end

    describe '#diff_middle_and_min' do
      it 'returns 242 (2143 - 1901)' do
        expect(subject.diff_middle_and_min(item_hash)).to eq(242)
      end
    end
  end
end
