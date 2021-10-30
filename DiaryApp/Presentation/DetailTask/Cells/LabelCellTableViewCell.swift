//
//  LabelCellTableViewCell.swift
//  DiaryApp
//
//  Created by Ильдар Арсламбеков on 29.10.2021.
//

import UIKit

class LabelCellTableViewCell: UITableViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func configure(text: String?, style: LabelCellStyle) {
        switch style {
        case .regular:
            cellLabel.text = text
        case .largeTitle:
            cellLabel.font =  UIFont(name: "GillSans", size: 26)!
            cellLabel.text = text
        }
    }
}

enum LabelCellStyle {
    case regular
    case largeTitle
}
