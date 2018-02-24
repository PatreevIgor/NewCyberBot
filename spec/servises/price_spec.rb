# frozen_string_literal: true

require 'rails_helper'

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

  describe '#get_max_price' do
    it 'returns max item price' do
      expect(subject.get_max_price(item_hash)).to eq(2900)
    end
  end

  describe '#get_middle_price' do
    it 'returns middle item price' do
      expect(subject.get_middle_price(item_hash)).to eq(2143)
    end
  end

  describe '#get_min_price' do
    it 'returns min item price' do
      expect(subject.get_min_price(item_hash)).to eq(1901)
    end
  end
end
