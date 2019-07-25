class Station < ApplicationRecord
  belongs_to :item, optional: true
end
