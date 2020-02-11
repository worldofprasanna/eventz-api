require 'rails_helper'

RSpec.describe Conference, type: :model do
  context 'discount_amount' do
    it 'should return proper value without promocode' do
      conference = create(:conference, price: 100)
      actual_amount = conference.discount_amount('INVALID', 3)
      expect(actual_amount).to eq(0)
    end

    it 'should return proper value with promocode' do
      conference = create(:conference, price: 100)
      create(:promo_code, code: 'CODE1', discount: 10)
      actual_amount = conference.discount_amount('CODE1', 3)
      expect(actual_amount).to eq(30)
    end
  end

  context 'final_amount' do
    it 'should return proper value with promocode' do
      conference = create(:conference, price: 100)
      create(:promo_code, code: 'CODE1', discount: 10)
      actual_amount = conference.final_amount('CODE1', 3)
      expect(actual_amount).to eq(270)
    end
  end
end
