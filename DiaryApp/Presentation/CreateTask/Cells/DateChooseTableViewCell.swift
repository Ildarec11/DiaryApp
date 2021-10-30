//
//  DateChooseTableViewCell.swift
//  DiaryApp
//
//  Created by Ильдар Арсламбеков on 30.10.2021.
//

import UIKit

class DateChooseTableViewCell: UITableViewCell {

    //MARK: - IBOutlets
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - Public functions
    public func configure(labelText: String) {
        label.text = labelText
    }
}
