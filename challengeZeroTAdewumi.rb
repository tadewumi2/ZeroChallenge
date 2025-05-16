# Name: Tosin Adewumi
require 'money'

Money.locale_backend = :currency
Money.rounding_mode = BigDecimal::ROUND_HALF_UP

# Create a money object (in cents)
sub_total = Money.new(500, 'CAD')
puts sub_total.format