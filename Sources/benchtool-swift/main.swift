import BigInt
import Foundation

func loopFibonnaci(n : Int) -> BigInt{
    var current = BigInt(0)
    var next = BigInt(1)
    var accumulator = BigInt(0)
    
    for _ in 0..<n {
        accumulator = next
        next = current + next
        current = accumulator
    }
    return accumulator
}


if CommandLine.arguments.count < 3 {
    print("Usage benchtool-swift 1 100000")
    exit(1)
} else {
    if CommandLine.arguments[1] != "1" {
        print("Only the benchtype 1 ( loop ) is implemented")
        exit(1)
    }
    let nValue = Int(CommandLine.arguments[2])
    if  nValue == nil {
        print("N need to be positive")
        exit(1)
    } else {
        print(loopFibonnaci(n:nValue!))
    }
    
}
