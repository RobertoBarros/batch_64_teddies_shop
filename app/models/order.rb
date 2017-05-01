class Order < ApplicationRecord
  monetize :amount_centavos
end
