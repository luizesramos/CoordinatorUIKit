//
//  Coordinator.swift
//  CoordinatorUIKit
//
//  Created by Luiz Ramos on 1/10/23.
//

import UIKit

enum NavigationEvent {
    case navigateToA
    case navigateToB
    case navigateToC
    case navigateBack
    case navigateToRoot
}

protocol Coordinator {
    func start()
    func navigate(event: NavigationEvent)
}

protocol InitializableCoordinator {
    var navigationController: UINavigationController? { get set }
    var children: [Coordinator] { get set }
}

protocol Coordinated {
    var coordinator: Coordinator? { get set }
}

typealias CoordinatedViewController = UIViewController & Coordinated

final class DefaultCoordinator: Coordinator, InitializableCoordinator {
    var navigationController: UINavigationController? = nil
    var children: [Coordinator] = []
    
    func start() {
        navigate(event: .navigateToA)
    }
    
    func navigate(event: NavigationEvent) {
        switch event {
        case .navigateToRoot:
            navigationController?.popToRootViewController(animated: true)

        case .navigateBack:
            navigationController?.popViewController(animated: true)

        case .navigateToA:
            guard let vc = UIStoryboard(name: "ViewA", bundle: nil).instantiateViewController(withIdentifier: "ViewControllerA") as? CoordinatedViewController else {
                fatalError("Bad storyboard")
            }
            push(viewController: vc)

        case .navigateToB:
            push(viewController: ViewControllerB())

        case .navigateToC:
            push(viewController: ViewControllerC())
        }
    }
    
    private func push(viewController: CoordinatedViewController) {
        var vc = viewController
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: true)
    }
}
