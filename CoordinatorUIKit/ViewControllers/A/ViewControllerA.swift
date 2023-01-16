//
//  ViewControllerA.swift
//  CoordinatorUIKit
//
//  Created by Luiz Ramos on 1/10/23.
//

import UIKit

final class ViewControllerA: CoordinatedViewController {
    var coordinator: Coordinator?
    
    @IBAction func didTapButton(_ sender: Any) {
        coordinator?.navigate(event: .navigateToB)
    }
    
    override func viewDidLoad() {
        title = "View A"
        view.backgroundColor = .orange
    }
}
