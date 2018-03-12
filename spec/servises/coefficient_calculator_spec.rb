# frozen_string_literal: true

require 'rails_helper'
require 'helpers'

RSpec.configure do |c|
  c.include Helpers
end

describe CoefficientCalculator do
  subject { described_class.new }
  let(:item_hash) do
    { 'classid'    => '57939697',
      'instanceid' => '0',
      'hash_name'  => 'Omnishred the Defiant',
      'price'      => 2.8,
      'time'       => '1519496533',
      'id'         => '41787754' }
  end

  describe '#coefficient_profit' do
    context 'when item is profit, clean_benefit == 2000' do
      before { allow(subject).to receive(:clean_benefit).with(item_hash).and_return(2000) }

      it 'returns 100' do
        expect(subject.coefficient_profit(item_hash)).to eq(100)
      end
    end

    context 'when item is profit, clean_benefit > 2000' do
      before { allow(subject).to receive(:clean_benefit).with(item_hash).and_return(2001) }

      it 'returns 100' do
        expect(subject.coefficient_profit(item_hash)).to eq(100)
      end
    end

    context 'when item is not profit, clean_benefit < 2000' do
      before { allow(subject).to receive(:clean_benefit).with(item_hash).and_return(1999) }

      it 'returns 0' do
        expect(subject.coefficient_profit(item_hash)).to eq(0)
      end
    end
  end

  describe '#coefficient_current_state' do
    before do
      allow_any_instance_of(described_class).to receive(:dposam).with(item_hash).and_return(dposam_result)
      allow_any_instance_of(described_class).to receive(:dmam).with(item_hash).and_return(dmam_result)
    end

    context 'when coeff equal from 0 to 99.99' do
      let(:dposam_result) { 100 }
      let(:dmam_result) { 500 }

      it 'returns 20' do
        expect(subject.coefficient_current_state(item_hash)).to eq(20)
      end
    end

    context 'when coeff equal 100' do
      let(:dposam_result) { 500 }
      let(:dmam_result) { 500 }

      it 'returns 100' do
        expect(subject.coefficient_current_state(item_hash)).to eq(100)
      end
    end

    context 'when coeff > 100' do
      let(:dposam_result) { 1000 }
      let(:dmam_result) { 500 }

      it 'returns 200' do
        expect(subject.coefficient_current_state(item_hash)).to eq(200)
      end
    end

    context 'when coeff equil' do
      let(:dposam_result) { -1 }
      let(:dmam_result) { 500 }

      it 'returns 0' do
        expect(subject.coefficient_current_state(item_hash)).to eq(0)
      end
    end
  end

  describe '#coefficient_frequency_purchase' do
    context 'when coeff equal 10' do
      let(:history_of_sales) do
        [{ 'l_time' => five_days_ago },
         { 'l_time' => one_week_ago },
         { 'l_time' => two_weeks_ago },
         { 'l_time' => more_month_days_ago }]
      end

      it 'returns 10' do
        expect(subject.coefficient_frequency_purchase(history_of_sales)).to eq(10)
      end
    end

    context 'when coeff equal 6' do
      let(:history_of_sales) do
        [{ 'l_time' => one_week_ago },
         { 'l_time' => two_weeks_ago },
         { 'l_time' => more_month_days_ago }]
      end

      it 'returns 6' do
        expect(subject.coefficient_frequency_purchase(history_of_sales)).to eq(6)
      end
    end

    context 'when coeff equal 3' do
      let(:history_of_sales) do
        [{ 'l_time' => one_week_ago },
         { 'l_time' => one_week_ago_other_time },
         { 'l_time' => more_month_days_ago }]
      end

      it 'returns 3' do
        expect(subject.coefficient_frequency_purchase(history_of_sales)).to eq(3)
      end
    end
  end
end
