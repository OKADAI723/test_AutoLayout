//
//  HeaderView.swift
//  test_AutoLayout
//
//  Created by Yudai Fujioka on 2021/05/08.
//

import UIKit

final class HeaderView: UIView {
    
    
    @IBOutlet private weak var firstLabel: UILabel!
    @IBOutlet private weak var secondLabel: UILabel!
    @IBOutlet private weak var textView: UITextView!
    
    func configure(sampleModel: SampleModel) {
        firstLabel.text = sampleModel.userName
        secondLabel.text = sampleModel.displayName
        textView.text = sampleModel.biography
    }
    
}
