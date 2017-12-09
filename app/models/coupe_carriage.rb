class CoupeCarriage < Carriage
  AVAILABLE_SEATS = %i[top_seats bottom_seats].freeze
  
  validates *AVAILABLE_SEATS, numericality: { only_integer: true, greater_than: 0 }
end

