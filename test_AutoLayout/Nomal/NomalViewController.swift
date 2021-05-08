//
//  NomalViewController.swift
//  test_AutoLayout
//
//  Created by Yudai Fujioka on 2021/05/08.
//

import UIKit

//SnapKitを使わないコードでの制約の付け方

final class NomalViewController: UIViewController {

    private let headerView: HeaderView = UINib.init(nibName: "HeaderView", bundle: nil).instantiate(withOwner: nil, options: nil).first as! HeaderView
    
    private  func createSampleModels() -> [SampleModel] {
      [SampleModel(userName: "@okadai", displayName: "EVH", biography: "こんにちは"),
       SampleModel(userName: "@fuji", displayName: "5150", biography: "こんばんは")
      ]
    }
    
    @IBOutlet private weak var headerContainerView: UIView! {
        didSet{
            headerContainerView.addSubview(headerView)
            
            //true（デフォルトがtrue）のままだと余計な制約が付くためfalseにしなければいけない
            headerView.translatesAutoresizingMaskIntoConstraints = false
            
            //制約をまとめて最後にactiveにする
            let constraints = [
                headerView.topAnchor.constraint(equalTo: headerContainerView.topAnchor),
                headerView.trailingAnchor.constraint(equalTo: headerContainerView.trailingAnchor),
                headerView.leadingAnchor.constraint(equalTo: headerContainerView.leadingAnchor),
                headerView.bottomAnchor.constraint(equalTo: headerContainerView.bottomAnchor)
            
            ]
            NSLayoutConstraint.activate(constraints)
            
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
