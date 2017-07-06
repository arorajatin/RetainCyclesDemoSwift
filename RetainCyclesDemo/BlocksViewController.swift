//
//  BlocksViewController.swift
//  RetainCyclesDemo
//
//  Created by Jatin Arora on 06/07/17.
//  Copyright © 2017 Jatin Arora. All rights reserved.
//

import UIKit

class BlocksViewController: UIViewController {

    var constraintResolver: ConstraintResolver?
    
    deinit {
        print("BlocksViewController dealloced")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        constraintResolver = ConstraintResolver(callback: { [weak self] (finish) in
            self?.resolvedConstraints()
        })
        
        constraintResolver?.addConstraint("TEST")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.async {
            self.constraintResolver?.changeConstraint("TEST", isConstraintMet: true)
        }
        
    }

    func resolvedConstraints() {
        print("Constraint resolver has resolved constraints")
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
