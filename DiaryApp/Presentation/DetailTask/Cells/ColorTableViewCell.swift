//
//  ColorTableViewCell.swift
//  DiaryApp
//
//  Created by Ильдар Арсламбеков on 29.10.2021.
//

import UIKit

class ColorTableViewCell: UITableViewCell {

    //MARK: - IBoutlets
    @IBOutlet weak var colorView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    //MARK: - Public functions
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func setColor(_ color: UIColor) {
        colorView.backgroundColor = color
    }
    
}
