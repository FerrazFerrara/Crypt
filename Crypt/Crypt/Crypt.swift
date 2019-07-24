//
//  Crypt.swift
//  Crypt
//
//  Created by Ferraz on 24/07/19.
//  Copyright © 2019 Ferraz. All rights reserved.
//

import Foundation
import UIKit

public class CryptCesar{
    
    private var key: [Int] = [0,0,0]
    private var messageCrypt: String = ""
    private let alphabet: [String] = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    private var alphabetChanged : [String]?
    private var alphabetStringChanged: String = ""
    private let alphabetString: String = "abcdefghijklmnopqrstuvwxyz"
    
    public func crypt(message: String) -> String{
        var num = 0
        key[0] = Int.random(in: 1...25)
        orderAlphabet(key: key[0])
        for i in 0...25{
            alphabetStringChanged.append(alphabetChanged![i])
        }
        for char in message{
            num = 0
            for charAlpha in alphabetString{
                if char == charAlpha || char == " "{
                    messageCrypt.append(alphabetStringChanged[num])
                    break
                }
                num += 1
            }
        }
        return messageCrypt
    }
    
    public func decrypt(message: String) -> String{
        var num = 0
        var messageDec = ""
        orderAlphabet(key: key[0])
        for i in 0...25{
            alphabetStringChanged.append(alphabetChanged![i])
        }
        for char in message{
            num = 0
            for charAlpha in alphabetStringChanged{
                if char == charAlpha || char == " "{
                    messageDec.append(alphabetString[num])
                    break
                }
                num += 1
            }
        }
        return messageDec
    }
    
    private func orderAlphabet(key: Int){
        alphabetChanged = alphabet
        var num = key
        var aux = ""
        while num != 0 {
            aux = alphabetChanged![0]
            for i in 1...25{
                alphabetChanged![i - 1] = alphabetChanged![i]
            }
            alphabetChanged![25] = aux
            num -= 1
        }
    }
}

extension StringProtocol {
    subscript(offset: Int) -> Element {
        return self[index(startIndex, offsetBy: offset)]
    }
    subscript(_ range: Range<Int>) -> SubSequence {
        return prefix(range.lowerBound + range.count)
            .suffix(range.count)
    }
    subscript(range: ClosedRange<Int>) -> SubSequence {
        return prefix(range.lowerBound + range.count)
            .suffix(range.count)
    }
    subscript(range: PartialRangeThrough<Int>) -> SubSequence {
        return prefix(range.upperBound.advanced(by: 1))
    }
    subscript(range: PartialRangeUpTo<Int>) -> SubSequence {
        return prefix(range.upperBound)
    }
    subscript(range: PartialRangeFrom<Int>) -> SubSequence {
        return suffix(Swift.max(0, count - range.lowerBound))
    }
}

extension LosslessStringConvertible {
    var string: String { return .init(self) }
}

extension BidirectionalCollection {
    subscript(safe offset: Int) -> Element? {
        guard !isEmpty, let i = index(startIndex, offsetBy: offset, limitedBy: index(before: endIndex)) else { return nil }
        return self[i]
    }
}
