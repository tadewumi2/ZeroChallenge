# Name: Tosin Adewumi
require 'money'

Money.locale_backend = :currency
Money.rounding_mode = BigDecimal::ROUND_HALF_UP

# Create a money object (in cents)
sub_total = Money.new(500, 'CAD')

#store tax rates in constants
PST_RATE = 0.07
GST_RATE = 0.05

# Calculate taxes
pst_amount = sub_total * PST_RATE
gst_amount = sub_total * GST_RATE

#calculate the grand total
grand_total = sub_total + gst_amount + pst_amount

#Display the results
puts "Subtotal: #{sub_total.format}"
puts "PST: #{pst_amount.format} - #{(PST_RATE * 100).to_i}%"
puts "GST: #{gst_amount.format} - #{(GST_RATE * 100).to_i}%"
puts "Grand Total: #{grand_total.format}"

#Question 2
if grand_total <= Money.new(500, 'CAD')
  puts "Pocket Change"
elsif grand_total > Money.new(500, 'CAD') && grand_total < Money.new(2000, 'CAD')
	puts "Wallet Time"
else
	puts "Charge It!"
end