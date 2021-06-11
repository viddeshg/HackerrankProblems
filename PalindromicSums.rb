# Test cases
TestCases = gets.to_i

TestCases.times do

    inputArray = gets.split.map(&:to_i)

    # Integer N as num     
    num = inputArray[0]

    # Difference in the AP series
    diff = inputArray[1]

    # Function to check if a number is palindrome or not
    def isPalindrome(number)
        # Converting integer to string
        numberString = number.to_s

        if numberString == numberString.reverse
            return true
        else
            return false
        end
        
    end

    requiredPalindromesArray = Array.new
    sumOfSquares = 0
    lowerBound = 1
    upperBound = num

    while (lowerBound < upperBound)
        for a in (lowerBound..upperBound).step(diff) do
            sumOfSquares += a*a

            if (sumOfSquares>num)
                break
            end

            if (isPalindrome(sumOfSquares) and a!=lowerBound and (sumOfSquares.to_s.reverse[0] != 0))
                requiredPalindromesArray.append(sumOfSquares)
            end
        end
        
        #Code Optimization - will exit while loop if square of lower bound 
        # is more than num
        if (a==lowerBound and sumOfSquares>num)
            break 
        end

        sumOfSquares = 0
        lowerBound += 1
    end

    puts requiredPalindromesArray.uniq.sum
end