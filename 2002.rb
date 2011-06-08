#!/usr/bin/env ruby

# Generic expression string
str = "1x2x3x4x5x6x7x8x9"
# Array of opperators, s is a placeholder for ""
opps = ["+", "*", "s"]

# Since there are 8 slots we need to replace with opperators
# and 3 possiblities for each slot. There are 3^8 - 1 (6560)
# possible combinations. We can express this in an 8 digit
# ternary string where each digit represents an opperator.

(0..6560).each do |i|
	# get our ternary string
	tstr = i.to_s(3).rjust(8, '0')
	
	# if the expression contains a number > 2002 we can
	# immediately disregard it.
	bignum = tstr.rindex("222")
	if(bignum == nil || bignum == 0) 
		# convert each digit to an index in the opps array
		# and replace the corresponding character in the
		# expression string
		(0..7).each do |j|
			str[(2*j)+1] = opps[tstr[j].chr.to_i()]
		end

		# replace the s placeholder with empty characters
		temp = str.gsub("s", "")
		# Evaluate!
		result = Kernel.eval(temp)
		if(result == 2002)
			puts temp + " = " + result.to_s()
		end
	end
end
