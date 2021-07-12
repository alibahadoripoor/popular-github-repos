//
//  BaseCoordinator.swift
//  popular-github-repos
//
//  Created by Mohammadali Bahadoripoor on 12.07.21.
//

import Foundation

class BaseCoordinator {
    private(set) var childCoordinators: [BaseCoordinator] = []
    
    func start() {
        
    }
    
    func finish(){
        
    }
    
    final func addCoordinator(_ coordinator: BaseCoordinator){
        childCoordinators.append(coordinator)
    }
    
    final func removeCoordinator(_ coordinator: BaseCoordinator){
        if let index = childCoordinators.firstIndex(of: coordinator) {
            childCoordinators.remove(at: index)
        } else {
            debugPrint("Couldn't remove coordinator: \(coordinator). It's not a child coordinator.")
        }
    }
}

extension BaseCoordinator: Equatable {
    static func == (lhs: BaseCoordinator, rhs: BaseCoordinator) -> Bool {
        return lhs === rhs
    }
}
