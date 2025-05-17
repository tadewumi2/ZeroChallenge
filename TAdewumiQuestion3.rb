#Name: Tosin Adewumi
require 'money'

Money.locale_backend = :currency
Money.rounding_mode = BigDecimal::ROUND_HALF_UP

# Prompt user for subtotal
puts "please enter the subtotal: $"
user_input = gets # Read user input and remove trailing newline

# convert input string to float
subtotal_float = user_input.to_f

# Convert float to cents (for Money object) and create Money object
# Money takes amounts in cents, so multiply by 100

subtotal = Money.new(subtotal_float * 100, 'CAD')

# Declare the PST and GST rates
PST_RATE = 0.07
GST_RATE = 0.05

# Calculate the pst and gst amount
pst_amount = PST_RATE * subtotal
gst_amount = GST_RATE * subtotal

# Calculate the grand total
grand_total = subtotal + gst_amount + pst_amount

# Display the result
puts "Subtotal: #{subtotal.format}"
puts "PST: #{pst_amount.format} - #{(PST_RATE * 100).to_i}%"
puts "GST: #{gst_amount.format} - #{(GST_RATE * 100).to_i}%"
puts "Grand Total: #{grand_total.format}"

#Comment for the output
if grand_total <= Money.new(500, 'CAD')
	puts "Pocket Change"
elsif grand_total > Money.new(500, 'CAD') && grand_total < Money.new(2000, 'CAD')
	puts "Wallet Time"
else
	puts "Charge It!"
end