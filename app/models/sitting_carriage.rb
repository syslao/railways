class SittingCarriage < Carriage
    AVAILABLE_SEATS = %i[seats].freeze
    
    validates *AVAILABLE_SEATS, numericality: { only_integer: true, greater_than: 0 }
end