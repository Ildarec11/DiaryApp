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
    private var inputHandler: ((String?) -> ())?
    
    //MARK: - IBOutlets
    @IBOutlet weak var textField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - Public functions
    public func configure(placeholder: String, style: LabelCellStyle, textEnteredHandler: @escaping (String?) -> Void) {
        textField.placeholder = placeholder
        textField.delegate = self
        switch style {
        case .regular:
            textField.font = UIFont.systemFont(ofSize: 15)
        case .largeTitle:
            textField.font = UIFont(name: "GillSans", size: 26)!
        }
        inputHandler = textEnteredHandler
    }
}

//MARK: - TextFieldDelegate
extension TextViewTableViewCell: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        inputHandler?(textField.text)
    }
}


