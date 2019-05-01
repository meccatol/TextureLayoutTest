//
//  ViewController.swift
//  TextureTest
//
//  Created by Hyungsung Kim on 15/04/2019.
//  Copyright © 2019 cream. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class ViewController: UIViewController {
    let backgroundNode = ASDisplayNode()
    let testContainerNode = TestContainer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.backgroundNode.automaticallyManagesSubnodes = true
        self.backgroundNode.layoutSpecBlock = { [weak self] (node, constraintSize) -> ASLayoutSpec in
            guard let unwrappedSelf = self else { return ASLayoutSpec() }
            return ASWrapperLayoutSpec(layoutElement: unwrappedSelf.testContainerNode)
        }
        
        self.backgroundNode.onDidLoad({ [weak self] _ in
            guard let unwrappedSelf = self else { return }
            unwrappedSelf.testContainerNode.backgroundColor = UIColor.lightGray
        })
        
        self.view.addSubview(self.backgroundNode.view)
        self.backgroundNode.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([self.view.topAnchor.constraint(equalTo: self.backgroundNode.view.topAnchor),
                                     self.view.leftAnchor.constraint(equalTo: self.backgroundNode.view.leftAnchor),
                                     self.view.bottomAnchor.constraint(equalTo: self.backgroundNode.view.bottomAnchor),
                                     self.view.rightAnchor.constraint(equalTo: self.backgroundNode.view.rightAnchor)])
    }
}
