//
//  TimersViewController.swift
//  RetainCyclesDemo
//
//  Created by Jatin Arora on 06/07/17.
//  Copyright © 2017 Jatin Arora. All rights reserved.
//

import UIKit

class TimersViewController: UIViewController {

    weak var nonRepeatingTimer: Timer?
    weak var repeatingTimer: Timer?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    deinit {
        print("TimersViewController dealloced")
    }
    
    /**Core Logic Begins**/
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        nonRepeatingTimer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(nonRepeatingTimerFired), userInfo: nil, repeats: false)
        repeatingTimer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(repeatingTimerFired), userInfo: nil, repeats: true)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        
        nonRepeatingTimer?.invalidate()
        repeatingTimer?.invalidate()
        
    }
    
    
    func nonRepeatingTimerFired() {
        print("Non-repeating timer fired")
    }
    
    func repeatingTimerFired() {
        print("Repeating timer fired")
    }
    
    /**Core Logic Ends **/
    
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
