//
//  DetailTaskModel.swift
//  DiaryApp
//
//  Created by Ильдар Арсламбеков on 27.10.2021.
//

import Foundation
import UIKit
class DetailTaskModel: NSObject {
    
    //MARK: - Properties
    var delegate: DetailTaskDelegate?
}

extension DetailTaskModel: UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
        switch textView.tag {
        case 1:
            delegate?.changedTaskName()
        case 2:
            delegate?.changedTaskDescription()
        default:
            return
        }
    }
}
