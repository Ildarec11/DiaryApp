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
    @IBOutlet weak var datePicker: UIDatePicker!
    
    //MARK: - Properties
    var dateChangedHandler: ((Date) -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - Public functions
    public func configure(labelText: String, dateInputHandler: @escaping (Date) -> ()) {
        datePicker.addTarget(self, action: #selector(dateChanged(datePicker:)), for: .valueChanged)
        label.text = labelText
        dateChangedHandler = dateInputHandler
        dateInputHandler(datePicker.date)
    }
    
    //MARK: - Private functions
    @objc private func dateChanged(datePicker: UIDatePicker) {
        dateChangedHandler?(datePicker.date)
    }
}
