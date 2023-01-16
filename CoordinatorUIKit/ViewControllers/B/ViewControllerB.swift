//
//  ViewControllerB.swift
//  CoordinatorUIKit
//
//  Created by Luiz Ramos on 1/10/23.
//

import UIKit

final class ViewControllerB: CoordinatedViewController {
    var coordinator: Coordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View B"
        view.backgroundColor = .green
        
        let button = UIButton(frame: .init(origin: .zero, size: .init(width: 100, height: 50)))
        button.setTitle("Hello", for: .normal)
        button.setTitle("Goodbye", for: .highlighted)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .yellow
        
        view.addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @IBAction func didTapButton(_ sender: Any) {
        coordinator?.navigate(event: .navigateToC)
    }
}
