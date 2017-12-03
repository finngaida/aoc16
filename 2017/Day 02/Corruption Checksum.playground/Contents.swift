//: Playground - noun: a place where people can play

import Foundation

enum E: Error {
    case unwrap(reason: String)
    case illegal(reason: String)
}

func getInput() throws -> String {
    guard let path = Bundle.main.path(forResource: "input", ofType: "txt") else { throw E.unwrap(reason: "Couldn't create path for input file") }
    guard let input = try? String(contentsOfFile: path) else { throw E.unwrap(reason: "couldn't read input") }
    return input
}

do {
    let input = try getInput()
    let lines = Array(input.components(separatedBy: "\n").dropLast())
    let values = lines.map { $0.components(separatedBy: "    ").flatMap { Int($0) } }

    let final = values.map({ $0.max(by: <)! - $0.max(by: >)! }).reduce(0, +)

    print(final)
} catch let e {
    print("Oops: \(e)")
}
