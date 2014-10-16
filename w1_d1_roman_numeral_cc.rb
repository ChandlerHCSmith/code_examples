
# Method 1 ----------------------------------------------------
# Converts Integers to Early Roman Numeral System equilivalents

def to_roman(num)
  num_string = ""
  thous = num/1000
  remainder_thous = num % 1000

  hunds = remainder_thous/100
  remainder_hunds = remainder_thous % 100

  tens = remainder_hunds/10
  remainder_ten = remainder_hunds % 10

  thous.times {num_string << "M"}
  hunds.times {num_string << "C"}
  tens.times {num_string << "X"}

  if remainder_ten >= 5
    num_string << "V"
    ones = remainder_ten % 5
    ones.times {num_string << "I"}
  else remainder_ten < 5
    remainder_ten.times {num_string << "I"}
  end
  return num_string
end

p to_roman(1) == "I"
p to_roman(3) == "III"
p to_roman(6) == "VI"
p to_roman(14) == "XIIII"
p to_roman(5234) == "MMMMMCCXXXIIII"
p to_roman(10954) == "MMMMMMMMMMCCCCCCCCCXXXXXIIII"


# Method 2 ----------------------------------------------------
# Converts Integers to Early Roman Numeral System equilivalents

def to_roman(num)
  num_string = ""
  thous_place = num/1000
  remainder_thous = num % 1000

  hunds_place = remainder_thous/100
  remainder_hunds = remainder_thous % 100

  tens_place = remainder_hunds/10
  remainder_ten = remainder_hunds % 10

# ----------------------Thousand's place------------------------

  thous_place.times {num_string << "M"}

# ----------------------Hundred's place------------------------
  if
    hunds_place == 9
    num_string << "CM"
  elsif hunds_place > 5 && hunds_place != 9
    num_string << "D"
    additional_hunds = hunds_place % 5
    additional_hunds.times {num_string << "C"}
  elsif hunds_place == 5
    num_string << "D"
  elsif hunds_place == 4
    num_string << "CD"
  else
    hunds_place.times {num_string << "C"}
  end
# ---------------------Ten's place ----------------------------
  if
    tens_place == 9
    num_string << "XC"
  elsif tens_place > 5 && tens_place != 9
    num_string << "L"
    additional_tens = tens_place % 5
    additional_tens.times {num_string << "X"}
  elsif tens_place == 5
    num_string << "L"
  elsif tens_place == 4
    num_string << "XL"
  else
    tens_place.times {num_string << "X"}
  end
# -------------------- One's place --------------------------
  if remainder_ten == 9
    num_string << "IX"
  elsif
    remainder_ten >= 5 && remainder_ten != 9
    num_string << "V"
    ones = remainder_ten % 5
    ones.times {num_string << "I"}
  elsif
    remainder_ten == 4
    num_string << "IV"
  else remainder_ten < 5 && remainder_ten != 4
    remainder_ten.times {num_string << "I"}
  end
  return num_string
end

p to_roman(1)
p to_roman(3)
p to_roman(6)
p to_roman(14)
p to_roman(949)
p to_roman(847)
p to_roman(10954)

# Driver code... these should print out trues.

p to_roman(1) == "I"
p to_roman(3) == "III"
p to_roman(6) == "VI"
p to_roman(14) == "XIV"
p to_roman(949) == "CMXLIX"
p to_roman(847) == "DCCCXLVII"
p to_roman(10954) == "MMMMMMMMMMCMLIV"





