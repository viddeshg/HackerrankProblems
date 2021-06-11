requiredPalindromesArray = Array.new

TestCases = gets.to_i

TestCases.times do
    # Test inputs
    inputArray = gets.split.map(&:to_i)
    num = inputArray[0]
    diff = inputArray[1]

    # Function to check if a number is palindrome or not
    def isPalindrome(number)
        numberString = number.to_s

        if numberString == numberString.reverse
            return true
        else
            return false
        end
    end

    # Finding nearest square of the palindrome
    upperBound = Math.sqrt(num).to_i
    sumOfSquares = 0 
    lowerBound = 1

    while (lowerBound < upperBound)
        for a in (lowerBound..upperBound).step(diff) do
            sumOfSquares += a*a

            if (sumOfSquares>=num)
                break
            end
            
            if (a!=lowerBound)
                if (isPalindrome(sumOfSquares))
                    requiredPalindromesArray.append(sumOfSquares)
                end
            end
        end

        sumOfSquares = 0
        lowerBound += 1
    end

    puts requiredPalindromesArray.uniq.sum
    requiredPalindromesArray.clear
end