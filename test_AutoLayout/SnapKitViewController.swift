//
//  SnapKitViewController.swift
//  test_AutoLayout
//
//  Created by Yudai Fujioka on 2021/05/08.
//

import UIKit
import SnapKit

//SnapKitを使った制約の付け方

final class SnapKitViewController: UIViewController {
    
    //customのviewを読み込む
    private let headerView: HeaderView = UINib.init(nibName: "HeaderView", bundle: nil).instantiate(withOwner: nil, options: nil).first as! HeaderView
    
    private  func createSampleModels() -> [SampleModel] {
        [SampleModel(userName: "@okadai", displayName: "EVH", biography: "こんにちは"),
         SampleModel(userName: "@fuji", displayName: "5150", biography: "こんばんは")
        ]
    }
    
    @IBOutlet private weak var headerContainerView: UIView! {
        didSet {
            headerContainerView.addSubview(headerView)
            //これだけで四方向のedgesを親viewに合わせられる
            headerView.snp.makeConstraints { $0.edges.equalToSuperview() }
            
            setUp()
        }
    }
    
    private func setUp() {
        let sampleModel = createSampleModels()
        
        for sampleModel in sampleModel {
            headerView.configure(sampleModel: sampleModel)
        }
    }
}
