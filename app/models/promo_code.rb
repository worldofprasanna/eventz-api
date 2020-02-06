class PromoCode < ApplicationRecord
  def self.validate(code)
    promo_code = PromoCode.find_by(code: code)
    if promo_code.present?
      return {
        'msg': "Applied promo code #{promo_code.name}",
        'discount': promo_code.discount
      }
    end
    {
      'msg': 'Invalid promo code',
      'discount': 0
    }
  end
end
