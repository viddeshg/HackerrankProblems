# Test cases
TestCases = gets.to_i

TestCases.times do

    inputArray = gets.split.map(&:to_i)

    # Integer N     
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

    # Storing all palindrones under the outer bound in an array
    palindromeArray  = Array.new
    loop = 1
    while (loop!= num)
        # digits ending in 0 cannot become a palindrome
        if (loop.to_s.reverse[0] == 0)
            loop += 1
        else 
            if isPalindrome(loop)
                palindromeArray.append(loop)
                loop += 1
            else 
                loop += 1
            end
        end
    end

    # Checking each element of the palindrome array
    requiredPalindromesArray  = Array.new

    palindromeArray.each do |palindrome|

        # Finding nearest square of the palindrome
        seriesUpperBound = Math.sqrt(palindrome).to_i

        seriesLowerBound = 1
        sumOfSquares = 0

        while (seriesLowerBound<seriesUpperBound)
            # Setting lower bound as the first term
            a = seriesLowerBound

            for a in (seriesLowerBound..seriesUpperBound).step(diff) do
                sumOfSquares += a*a

                # Break the Loop if sum of squares is equal to the palindrome 
                # or greater than it
                if sumOfSquares >= palindrome
                    if sumOfSquares == palindrome
                        requiredPalindromesArray.append(palindrome)
                    end
                    break
                end

            end

            # Break the Loop if sum of squares is equal to the palindrome 
            if sumOfSquares == palindrome
                break
            end

            sumOfSquares = 0
            seriesLowerBound += 1
        end
    end

    print requiredPalindromesArray
    puts requiredPalindromesArray.sum

end