//
//  ViewControllerC.swift
//  CoordinatorUIKit
//
//  Created by Luiz Ramos on 1/10/23.
//

import UIKit

final class ViewControllerC: CoordinatedViewController {
    var coordinator: Coordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View C"
        view.backgroundColor = .blue
        
        let button = UIButton(frame: .init(origin: .zero, size: .init(width: 100, height: 50)))
        button.setTitle("Hello", for: .normal)
        button.setTitle("Goodbye", for: .highlighted)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        
        view.addSubview(button)
        button.center = view.center
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @IBAction func didTapButton(_ sender: Any) {
        coordinator?.navigate(event: .navigateToRoot)
    }
}
