//
//  TextViewTableViewCell.swift
//  DiaryApp
//
//  Created by Ильдар Арсламбеков on 30.10.2021.
//

import UIKit
class TextViewTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    private var placeholder: String?
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var textField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - Public functions
    public func configure(placeholder: String, style: LabelCellStyle) {
        textField.placeholder = placeholder
        switch style {
        case .regular:
            return
        case .largeTitle:
            textField.font = UIFont(name: "GillSans", size: 26)!
        }
    }
}


