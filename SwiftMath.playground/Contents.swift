//: Playground - noun: a place where people can play

import UIKit

infix operator **
func **(lhs: Int, rhs: Int) -> Int {
    var sum = lhs
    for _ in 1..<rhs {
        sum *= lhs
    }
    return sum
}

extension Int {
    var absoluteValue: Int {
        return abs(self)
    }
    
    var prime: Bool {
        guard absoluteValue > 1 else { return false }
        
        for divisor in 2..<absoluteValue where absoluteValue % divisor == 0 {
            return false
        }
        return true
    }
    
    var factors: [Int] {
        return (1...absoluteValue).filter { divisor in
            return absoluteValue % divisor == 0
        }
    }
    
    func isDivisible(by divisor: Int) -> Bool {
        return self % divisor == 0
    }
}

struct Polynomial {
    let coefficents: [Int]

    var representation: String {
        var string = ""
        for (index, coefficent) in coefficents.enumerated() {
            guard coefficent != 0 else { continue }
            
            var term = coefficent >= 0 ? " + \(coefficent)" : " - \(coefficent)"
            term += "x^\(coefficents.count-1 - index)"
            
            if index == coefficents.count - 1 {
                term.removeLast()
                term.removeLast()
                term.removeLast()
            } else if index == coefficents.count - 2 {
                term.removeLast()
                term.removeLast()
            }
            string += term
        }
        string.removeFirst()
        string.removeFirst()
        return string
    }
    
    func evaluate(for x: Int) -> Int {
        var total = coefficents.last ?? 0
        for (index, coefficent) in coefficents[0..<coefficents.count-1].enumerated() {
            total += coefficent * (x ** (coefficents.count - 1 - index))
        }
        return total
    }
}

let polynomial = Polynomial(coefficents: [1, 0, 0, 0, -1, 0])

