//
//  ViewController.swift
//  GCDSamples
//
//  Created by Gabriel Theodoropoulos on 07/11/16.
//  Copyright © 2016 Appcoda. All rights reserved.
//

// http://www.appcoda.com/grand-central-dispatch/

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//         simpleQueues()
//         queuesWithQoS()
//         concurrentQueues()
//        if let queue = inactiveQueue {
//            queue.activate()
//         }
//         queueWithDelay()
//         fetchImage()
         useWorkItem()
    }
    
    func simpleQueues() {
        
        let queue = DispatchQueue(label: "wes.vdk.simpleQueue")
        
        queue.async {
            for i in 1...10 {
                print("🔴 ", i)
            }
        }
        
        for i in 101...110 {
            print("🔵 ", i)
        }
        
    }
    
    func queuesWithQoS() {
        
        let queue1 = DispatchQueue(label: "wes.vdk.queue1", qos: DispatchQoS.background)
        let queue2 = DispatchQueue(label: "wes.vdk.queue2", qos: DispatchQoS.userInteractive)
        
        queue1.async {
            for i in 1...10 {
                print("🔴 ", i)
            }
        }
        
        queue2.async {
            for i in 101...110 {
                print("🔵 ", i)
            }
        }
        
        for i in 1000..<1010 {
            print("Ⓜ️", i)
        }

        
    }
    
    var inactiveQueue: DispatchQueue!
    
    func concurrentQueues() {
        let anotherQueue = DispatchQueue(label: "com.appcoda.anotherQueue", qos: .utility, attributes: [.initiallyInactive, .concurrent])
        inactiveQueue = anotherQueue
        
        anotherQueue.async {
            for i in 1...10 {
                print("🔴 ", i)
            }
        }
        
        anotherQueue.async {
            for i in 101...110 {
                print("🔵 ", i)
            }
        }
        
        anotherQueue.async {
            for i in 1001...1010 {
                print("⚫️ ", i)
            }
        }
    }
    
    func queueWithDelay() {
        let delayQueue = DispatchQueue(label: "wes.vdk.delayqueue", qos: .userInitiated)
        
        print(Date())
        
        let additionalTime: DispatchTimeInterval = .seconds(2)
        
        delayQueue.asyncAfter(deadline: .now() + additionalTime) { 
            print(Date())
        }
    }
    
    func fetchImage() {

        let imageURL: URL = URL(string: "http://www.appcoda.com/wp-content/uploads/2015/12/blog-logo-dark-400.png")!
        
        (URLSession(configuration: URLSessionConfiguration.default)).dataTask(with: imageURL, completionHandler: { (imageData, response, error) in
            
            if let data = imageData {
                print("Did download image data")
                
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data)
                }
                
            }
        }).resume()
        
    }
    
    func useWorkItem() {
        
        let workItem = DispatchWorkItem.init { 
            print("this is a work item")
        }
        
    }
    
}

