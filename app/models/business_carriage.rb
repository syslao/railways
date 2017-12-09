class BusinessCarriage < Carriage
    AVAILABLE_SEATS = %i[bottom_seats].freeze

    validates *AVAILABLE_SEATS, numericality: { only_integer: true, greater_than: 0 }
end
