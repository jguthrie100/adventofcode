first_digit = nil
prev_digit = nil
curr_digit = nil
total = 0

File.open('day1-inverse-captcha.txt').each do |line|
  line.chars.each do |c|
    if c.match(/[0-9]/)
      curr_digit = c.to_i
      
      if first_digit.nil?
        first_digit = curr_digit
        prev_digit = curr_digit
      else
        if c.to_i == prev_digit
          total += curr_digit
        end
        prev_digit = curr_digit
      end      
    end
  end
end

total += curr_digit if curr_digit == first_digit

puts total