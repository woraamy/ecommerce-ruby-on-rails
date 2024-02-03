class Product < ApplicationRecord
    has_one_attached :image

    validates :sku, :name, presence: true
    validates :price, numericality: { greater_than: 0 }
    validates :stock, numericality: { greater_than_or_equal_to: 0 }
end
