//
//  Code.swift
//  awaitLearn
//
//  Created by yangtz on 2024/2/1.
//

import Foundation

// var number = 10
// var finishNumber = 0
// let startTime = Date.now
//
// func worker(sqnumber: Int) {
//    print("\(sqnumber) begin working")
//    sleep(2)
//    Task {
//        print("\(sqnumber) begin wuxiu")
//        sleep(1)
//        print("\(sqnumber) wuxiu end")
//    }
//    print("\(sqnumber) continue work")
//    sleep(2)
//    print("\(sqnumber) work end")
//    finishNumber += 1
////    if(finishNumber == number) {
////        //print(st)
////    }
// }

// private 写在最上层等于 fileprivate
private struct node {
    var name: String = "ytz"
}
func start() {
    var ok = node()
    print(ok.name)
}
