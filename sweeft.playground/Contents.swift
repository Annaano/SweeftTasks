import UIKit

///***********1**********///
func minSplit(amount: Int) -> Int {
    let coins = [1, 5, 10, 20, 50]
    var dp = Array(repeating: amount+1, count: amount+1)
    dp[0] = 0
    for i in 1...amount {
        for coin in coins {
            if coin <= i {
                dp[i] = min(dp[i], dp[i - coin] + 1)
            }
        }
    }
    return dp[amount] > amount ? -1 : dp[amount]
}
minSplit(amount: 9)
minSplit(amount: 26)
minSplit(amount: 172)




///***************2************///
func sumOfDigits(start: Int, end: Int) -> Int {
    var sum = 0
    for i in start...end {
        var n = i
        while n > 0 {
            sum += n % 10
            n /= 10
        }
    }
    return sum
}
sumOfDigits(start:7, end: 8)
sumOfDigits(start:17, end:20)
sumOfDigits(start:10, end:12)



///**************3***********///
func isProperly(sequence: String) -> Bool {
    var stack = [Character]()
    for char in sequence {
        if char == "(" {
            stack.append(char)
        } else if char == ")" {
            if stack.isEmpty {
                return false
            } else {
                stack.removeLast()
            }
        }
    }
    return stack.isEmpty
}

isProperly(sequence: "(()())")
isProperly(sequence: ")(()")
isProperly(sequence: "(()())(")


///**************4***********///

func countWays(n: Int, steps: [Int]) -> Int {
    if steps.count == 1 {
        return steps[0] == 1 ? 2 : 1
    }
    var dp = Array(repeating: 0, count: n + 1)

    dp[0] = steps[0] == 1 ? 1 : 0
    dp[1] = steps[1] == 1 ? dp[0] + 1 : 0
    for i in 2...n {
        if i == n {
            return dp[i - 1] + dp[i - 2]
        }
        if steps[i] == 1 {
            dp[i] = dp[i - 1] + dp[i - 2]
        } else {
            dp[i] = 0
        }
    }
    return -1
}
countWays(n: 3, steps: [0,1,0])
countWays(n: 4, steps: [0,1,1,0])
countWays(n: 5, steps: [1,1,0,1,1])


///**************5***********///

func zeros(N: Int) -> Int {
    var count = 0
    for i in 1...N {
        var num = i
        while num % 5 == 0 {
            count += 1
            num/=5
        }
    }
    return count
}
zeros(N: 7)
zeros(N: 12)
zeros(N: 490)


