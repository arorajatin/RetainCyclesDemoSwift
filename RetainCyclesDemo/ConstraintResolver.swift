//
//  ConstraintResolver.swift
//
//  Created by Jatin Arora
//

import Foundation

public final class ConstraintResolver {
    public typealias ConstraintResolverCallBack = (Bool) -> Void
    
    fileprivate var constraints: [String: Bool]
    fileprivate let callBack: ConstraintResolverCallBack
    
    public init(callback: @escaping ConstraintResolverCallBack) {
        self.callBack = callback
        self.constraints = [String: Bool]()
    }
    
    public func addConstraint(_ name: String) {
        self.constraints[name] = false
    }
    
    public func changeConstraint(_ name: String, isConstraintMet: Bool) {
        self.constraints[name] = isConstraintMet
        var isAllConstraintsSatisfied = true
        for isConstraintSatisfied in self.constraints.values {
            if(!isConstraintSatisfied) {
                isAllConstraintsSatisfied = false
                break
            }
        }
        
        self.callBack(isAllConstraintsSatisfied)
    }
    
    public static func strongify<Context: AnyObject, Argument>(_ context: Context?,
                                 closure: @escaping (Context, Argument) -> Void) -> ((Argument) -> Void) {
        
        return { [weak context] argument in
            guard let strongContext = context else { return }
            closure(strongContext, argument)
        }
        
    }
}
