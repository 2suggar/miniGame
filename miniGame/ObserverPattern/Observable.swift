//
//  Observable.swift
//  miniGame
//
//  Created by Ekaterina Akulina on 02.03.2021.
//

import Foundation

class Observable<Type> {
    
    public var value: Type {
        didSet {
            notifyCallbacks(value: value)
        }
    }
    
    private var callbacks: [Callback] = []
    
    fileprivate class Callback {
        fileprivate weak var observer: AnyObject?
        fileprivate let closure: (Type) -> Void

        fileprivate init(observer: AnyObject,
                         closure: @escaping (Type) -> Void) {
            self.observer = observer
            self.closure = closure
        }
    }

    
    init(value: Type) {
        self.value = value
    }
    
    public func addObserver(_ observer: AnyObject, closure: @escaping (Type)->Void) {
        let callback = Callback(observer: observer, closure: closure)
        callbacks.append(callback)
    }
    
    public func removeObserver(_ observer: AnyObject) {
        callbacks = callbacks.filter { $0.observer !== observer }
    }
    
    private func notifyCallbacks(value: Type) {
        callbacks.forEach { $0.closure(value) }
    }

}
