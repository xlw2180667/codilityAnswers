//
//  ViewController.swift
//  try
//
//  Created by Xie Liwei on 16/9/24.
//  Copyright © 2016年 Xie Liwei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //print(solution(N: 51712))
        //print(solution(A: [7,3,9,3,9,9,9]))
        //print(solution(A: [3,8,9,7,6], 8))
        var A = [-1,2,100000]
        print(missingInteger(A: &A))
        //print(solution(X: 10, 85, 30))
        //print(sum(newArray: A))
    }
    
    //lesson 1 binaryGap
    public func binaryGap(N : Int) -> Int {
        let binaryN = String(N, radix : 2)
        print(binaryN)
        let loopN = binaryN + "a"
        var gap:[String] = []
        var maxGap = 0
        for num in loopN.characters {
            if (num == "0") {
                gap.append("0")
            } else {
                if (gap.count > maxGap) {
                   maxGap = gap.count
                }
                gap = []
            }
        }
        return maxGap
    }    
    //lesson 2 OddOccurrencesInArray
    public func oddOccurrencesInArray( A : [Int]) -> Int {
        //9393979
        var oddNumber = 0
        for number in A {
            oddNumber ^= number
        }
        return oddNumber
    }
    // lesson 2 CyclicRotation
    public func cyclicRotation( A : [Int], _ K : Int) -> [Int] {
        var i = 1
        var mutableCopyOfA = A
        while i<=K {
            i += 1
            let lastElement = mutableCopyOfA[mutableCopyOfA.count-1]
            mutableCopyOfA.insert(lastElement, at: 0)
            mutableCopyOfA.removeLast()
        }
        return mutableCopyOfA
    }
    // lesson 3 TapeEquilibrium
    public func tapeEquilibrium(A : inout [Int]) -> Int {
        var sumA = 0
        for i in A {
            sumA += i
        }
        var sumLeft = 0
        let PEqulOne = abs(2*A[0]-sumA)
        var ans = PEqulOne
        switch A.count {
        case 2:
            //finalA.append(PEqulOne)
            ans = PEqulOne
        default:
            for P in 1...A.count-1 {
                sumLeft += A[P-1]
                let abseluteDifference = abs(2*sumLeft-sumA)
                if (abseluteDifference < ans){
                    ans = abseluteDifference
                }
            }
        }
        return ans
    }
    // lesson 3 FrogJump
    public func frogJump(X : Int, _ Y : Int, _ D : Int) -> Int {
        var time = 0
        let timeFloat : Double = Double(Y - X) / Double(D)
        time = Int(ceil(timeFloat))
        return time
    }
    // lesson 3 PermMissingElem
    public func permMissingElem( A : inout [Int]) -> Int {
        var missNumber = 0
        if A == [] {
            missNumber = 1
        } else if A.count == 1 {
            if A[0] == 1 {
                missNumber = 2
            } else {
                missNumber = 1
            }
        } else {
            var sum = 0
            let sumN = (A.count + 2) * (A.count + 1) / 2
            for number in A {
            sum += number
        }
            missNumber = sumN - sum
        }
        return missNumber
    }
    // lesson 4 PermCheck
    public func permCheck( A : inout [Int]) -> Int {
//        var ans = 0
//        if A.count == 1 {
//            if A[0] == 1 {
//                ans = 1
//            } else {
//                ans = 0
//            }
//        } else {
//            let sum = A.count * (A.count - 1) / 2
//            var sumA = 0
//            for number in A {
//                sumA += number
//            }
//            if sumA == sum {
//                ans = 1
//            }else {
//                ans = 0
//            }
//        } failure cuz antiSum :(
//        var B = [Int]()
//        for i in 1...A.count {
//            B.append(i)
//        }
//        if A.sorted() == B {
//            return 1
//        } else {
//            return 0
//        }
//    } Correctness 100% Performance 20% cuz Sorted()
        var B = Array(repeating: false, count: A.count)
        for number in A {
            if number > A.count { // There is as least a number is bigger than the length of A
                return 0
            } else if B[number - 1] == true {
                return 0
            }
            B[number - 1] = true
        }
        return 1
    }
    // lesson 4 MissingInteger
    public func missingInteger( A : inout [Int]) -> Int {
        var ans = 0
        var B = Array(repeating: 0, count: 100001)
        if A.count == 1 {
            if A[0] == 1{
                return 2
            } else {
                return 1
            }
        }
        for i in A {
            if i > 0 && i <= 100000{
            B[i - 1] = i
            }
        }
        for i in 1...B.count + 1 {
                if B[i-1] == 0 {
                    ans = i
                    break
                }
            }
        return ans
    }


}





















