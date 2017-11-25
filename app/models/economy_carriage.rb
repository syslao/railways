class EconomyCarriage < Carriage
  AVAILABLE_SEATS = %i[top_seats bottom_seats side_bottom_seats side_top_seats].freeze
  
  validates *AVAILABLE_SEATS, numericality: { only_integer: true, greater_than: 0 }
end
