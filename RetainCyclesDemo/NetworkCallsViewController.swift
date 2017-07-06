//
//  NetworkCallsViewController.swift
//  RetainCyclesDemo
//
//  Created by Jatin Arora on 06/07/17.
//  Copyright © 2017 Jatin Arora. All rights reserved.
//

import UIKit

class NetworkCallsViewController: UIViewController {

    deinit {
        print("NetworkCallsViewController dealloced")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.makeNetworkCall()
    }

    func makeNetworkCall() {
        
        
        let urlSession = URLSession(configuration: URLSessionConfiguration.default)
        guard let url = URL(string:"https://hacker-news.firebaseio.com/v0/topstories.json") else {
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = ["Content-Type": "application/json"]
        urlRequest.timeoutInterval = 10
        
        let task = urlSession.dataTask(with: urlRequest) { (data, response, error) in
            self.printStories(data: data)
        }
        task.resume()
    }
    
    func printStories(data: Data?) {
        print("\(String(describing: data))")
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
