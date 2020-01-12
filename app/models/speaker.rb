class Speaker < ApplicationRecord
  require 'activerecord-import'
  require 'activerecord-import/base'

  has_many :talks, dependent: :destroy
end
