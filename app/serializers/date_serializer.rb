# frozen_string_literal: true

class DateSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :best_day, :name, :revenue
end
