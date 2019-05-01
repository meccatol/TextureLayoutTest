//
//  TestContainer.swift
//  TextureTest
//
//  Created by Hyungsung Kim on 16/04/2019.
//  Copyright © 2019 cream. All rights reserved.
//

import Foundation
import AsyncDisplayKit

class TestContainer: ASDisplayNode {
    
    let a_container = ASDisplayNode()
    let b_container = ASDisplayNode()
    let c_container = ASDisplayNode()
    let d_container = ASDisplayNode()
    let e_container = ASDisplayNode()
    let f_container = ASDisplayNode()
    let g_container = ASDisplayNode()
    let h_container = ASDisplayNode()
    
    let button_1 = ASButtonNode()
    
    let bg_container = ASDisplayNode()
    let bg2_container = ASDisplayNode()
    let bg3_container = ASDisplayNode()
    
    override init() {
        super.init()
        
        self.automaticallyManagesSubnodes = true
        
        self.a_container.backgroundColor = UIColor.green
        self.b_container.backgroundColor = UIColor.red
        self.c_container.backgroundColor = UIColor.blue
        
        self.d_container.backgroundColor = UIColor.cyan
        self.e_container.backgroundColor = UIColor.purple
        self.f_container.backgroundColor = UIColor.orange
        
        self.g_container.backgroundColor = UIColor.lightGray
        self.h_container.backgroundColor = UIColor.darkGray
        
        self.button_1.backgroundColor = UIColor.magenta
        self.button_1.setTitle("Button Title", with: .systemFont(ofSize: 13), with: .white, for: .normal)
        self.button_1.addTarget(self, action: #selector(button1Test(_:)), forControlEvents: .touchUpInside)
        
        self.bg_container.backgroundColor = UIColor.black
        self.bg2_container.backgroundColor = UIColor.black
        self.bg3_container.backgroundColor = UIColor.yellow
    }
    
    override func safeAreaInsetsDidChange() {
        self.setNeedsLayout()
    }
    
    @objc
    func button1Test(_ button: ASButtonNode) {
        
    }
    
//    // horizontal, vertical layout specs test
//    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
//
//        self.a_container.style.preferredSize = .init(width: 50, height: 50)
//        self.b_container.style.preferredSize = .init(width: 60, height: 50)
//        self.b_container.cornerRadius = 10
//
//        self.a_container.style.layoutPosition = .init(x: 50, y: 50)
//        self.b_container.style.layoutPosition = .init(x: 100, y: 100)
//
//        self.d_container.style.preferredSize = .init(width: 20, height: 80)
//        self.e_container.style.preferredSize = .init(width: 140, height: 30)
//        self.f_container.style.preferredSize = .init(width: 60, height: 70)
//
//
//        // default : 최대한 늘어남, sizeToFit : 자식들의 모든 프레임을 합하여 프레임을 계산함. union 연산.
//        let abSpec = ASAbsoluteLayoutSpec(sizing: .default, children: [self.a_container, self.b_container])
//
//        let bgSpec = ASBackgroundLayoutSpec(child: abSpec, background: self.bg_container)
//
//        let verticalLayoutSpec = ASStackLayoutSpec()
//        verticalLayoutSpec.direction = .vertical
//        verticalLayoutSpec.children = [d_container, e_container, f_container]
//        verticalLayoutSpec.horizontalAlignment = .left
//        verticalLayoutSpec.verticalAlignment = .top
//
//        let bg2Spec = ASBackgroundLayoutSpec(child: verticalLayoutSpec, background: self.bg2_container)
//
//        let wholeLayoutSpec = ASStackLayoutSpec(direction: .vertical,
//                                                spacing: 10,
//                                                justifyContent: .start,
//                                                alignItems: .start,
//                                                children: [bgSpec, bg2Spec])
//
//        return ASInsetLayoutSpec(insets: self.safeAreaInsets, child: wholeLayoutSpec)
//    }
    
    // horizontal, vertical layout specs test
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {

        self.a_container.style.preferredSize = .init(width: 50, height: 50)
        self.b_container.style.preferredSize = .init(width: 60, height: 50)
        self.c_container.style.preferredSize = .init(width: 40, height: 70)
        self.d_container.style.preferredSize = .init(width: 20, height: 80)
        self.e_container.style.preferredSize = .init(width: 140, height: 30)
        self.f_container.style.preferredSize = .init(width: 60, height: 70)

//        self.g_container.style.preferredSize = .init(width: 250, height: 250)
        self.g_container.style.preferredLayoutSize = .init(width: ASDimensionMake("auto"), height: ASDimensionMake("auto"))
        
//        self.g_container.style.maxLayoutSize = .init(width: ASDimensionMake("80%"), height: ASDimensionMake("auto"))

//        self.h_container.style.preferredSize = .init(width: 200, height: 200)

        self.button_1.style.preferredSize = .init(width: 100, height: 100)

        let horizontalLayoutSpec = ASStackLayoutSpec(direction: .horizontal,
                                                     spacing: 10,
                                                     justifyContent: .center,
                                                     alignItems: .start,
                                                     children: [a_container, b_container, c_container, button_1])

        let bgSpec = ASBackgroundLayoutSpec(child: horizontalLayoutSpec, background: self.bg_container)

        let verticalLayoutSpec = ASStackLayoutSpec()
        verticalLayoutSpec.direction = .vertical
        verticalLayoutSpec.children = [d_container, e_container, f_container]
        verticalLayoutSpec.horizontalAlignment = .middle
        verticalLayoutSpec.verticalAlignment = .top
        
        let bg2Spec = ASBackgroundLayoutSpec(child: verticalLayoutSpec, background: self.bg2_container)

        let ratioSpec = ASRatioLayoutSpec(ratio: 1, child: self.g_container)
        ratioSpec.style.preferredLayoutSize = .init(width: ASDimensionMake("80%"), height: ASDimensionMake("auto"))
        let wrapperSpec = ASWrapperLayoutSpec(layoutElements: [ratioSpec])

        let wholeLayoutSpec = ASStackLayoutSpec(direction: .vertical,
                                                spacing: 10,
                                                justifyContent: .start,
                                                alignItems: .start,
                                                children: [bgSpec, bg2Spec, wrapperSpec])

        let bg3Spec = ASBackgroundLayoutSpec(child: wholeLayoutSpec, background: self.bg3_container)


        return ASInsetLayoutSpec(insets: self.safeAreaInsets, child: bg3Spec)
    }
    
//    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
//
//        self.a_container.style.preferredSize = .init(width: 50, height: 50)
//        self.b_container.style.preferredSize = .init(width: 60, height: 50)
//        self.c_container.style.preferredSize = .init(width: 40, height: 70)
//        self.d_container.style.preferredSize = .init(width: 20, height: 80)
//        self.e_container.style.preferredSize = .init(width: 140, height: 30)
//        self.f_container.style.preferredSize = .init(width: 60, height: 70)
//
//        let horizontalLayoutSpec = ASStackLayoutSpec(direction: .horizontal,
//                                                     spacing: 10,
//                                                     justifyContent: .start,
//                                                     alignItems: .start,
//                                                     children: [a_container, b_container, c_container])
//
//        let bgSpec = ASBackgroundLayoutSpec(child: horizontalLayoutSpec, background: bg_container)
//
//        let horizontalLayoutSpec2 = ASStackLayoutSpec()
//        horizontalLayoutSpec2.direction = .horizontal
//        horizontalLayoutSpec2.children = [a_container, b_container, c_container]
//        horizontalLayoutSpec2.horizontalAlignment = .left
//        horizontalLayoutSpec2.verticalAlignment = .top
//
//        horizontalLayoutSpec2.horizontalAlignment = .middle
//        horizontalLayoutSpec2.verticalAlignment = .bottom
//
//        return ASInsetLayoutSpec(insets: self.safeAreaInsets, child: bgSpec)
//    }
    
////     ASWrapperLayoutSpec 의 오작동
//    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
//
////        a_container.style.width = ASDimension(unit: .points, value: 200)
////        a_container.style.height = ASDimension(unit: .points, value: 200)
//
//        a_container.style.preferredSize = .init(width: 200, height: 200)
//
//        return ASWrapperLayoutSpec(layoutElement: a_container)
//    }
    
//    override func calculateSizeThatFits(_ constrainedSize: CGSize) -> CGSize {
//        let size = super.calculateSizeThatFits(constrainedSize)
//
//        return size
//    }
}
