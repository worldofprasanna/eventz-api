class Speaker < ApplicationRecord
  require 'activerecord-import'
  require 'activerecord-import/base'

  has_many :talks, dependent: :destroy
  has_and_belongs_to_many :conferences
end
