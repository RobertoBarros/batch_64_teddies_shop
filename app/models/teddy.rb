class Teddy < ApplicationRecord
  monetize :price_centavos
  belongs_to :category
end
