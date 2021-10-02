//
//  DiningPhilosophers.swift
//  DiningPhilosophers
//
//  Created by Sarah Lee on 10/2/21.
//
// Swift - Semaphore
// https://medium.com/@roykronenfeld/semaphores-in-swift-e296ea80f860
// Main & Global DispatchQueue
// https://cocoacasts.com/mastering-grand-central-dispatch-main-and-global-dispatch-queues
import Foundation

class SemaphorePractice {
    let semaphore = DispatchSemaphore(value: 1)

    func whoUsesForks() {
        DispatchQueue.global().async {
            print("philosopher 1 wait")
            self.semaphore.wait()
            print("philosopher 1 wait finished")
            sleep(1)
            self.semaphore.signal()
            print("philosopher 1 finished eating")
        }
        
        DispatchQueue.global().async {
            print("philosopher 2 wait")
            self.semaphore.wait()
            print("philosopher 2 wait finished")
            sleep(1)
            self.semaphore.signal()
            print("philosopher 2 finished eating")
        }
        
        DispatchQueue.global().async {
            print("philosopher 3 wait")
            self.semaphore.wait()
            print("philosopher 3 wait finished")
            sleep(1)
            self.semaphore.signal()
            print("philosopher 3 finished eating")
        }
    }
    
    let queue = DispatchQueue(label: "practice", attributes: .concurrent)
    let semaphore2 = DispatchSemaphore(value: 3)

    func downloadMusics() {
        for i in 0 ..< 15 {
            queue.async {
                let songNum = i+1
                self.semaphore2.wait()
                print("Downloading song", songNum)
                sleep(2) // download take ~2 sec
                print("Downloaded song", songNum)
                self.semaphore2.signal()
            }
        }
    }

}


