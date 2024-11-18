class Book < ApplicationRecord
    scope :costly, -> { where('price > ?', 3000) }
    
    belongs_to :publisher
    has_many :book_authors
    has_many :authors, through: :book_authors

    validates :name, presence: true
    validates :name, length: { maximum: 25 }
    validates :price, numericality: { greater_than_or_equal_to: 0 }

    after_destroy :if => :high_price? do
        Rails.logger.info "Book with high place destroyed: #{self.attributes}"
        Rails.logger.warn "Please check!!!"
    end

    def high_price?
        price > 5000
    end

    enum sales_status: {
        reservation: 0,
        now_on_sale: 1,
        end_of_print: 2
    }
end
