//
//  AddTaskColorTableViewCell.swift
//  DiaryApp
//
//  Created by Ильдар Арсламбеков on 30.10.2021.
//

import UIKit
import MKColorPicker

class AddTaskColorTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    private var controller: UIViewController?
    let colorPicker: ColorPickerViewController = {
        let picker = ColorPickerViewController()
        picker.allColors = [#colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1), #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1), #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1), #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1), #colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1), #colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1)]
        return picker
    }()
    
    //MARK: - IBOutlets
    @IBOutlet weak var chooseColorButton: UIButton!
    
    //MARK: - IBActions
    @IBAction func chooseButtonPressed(_ sender: UIButton) {
        if let popoverController = colorPicker.popoverPresentationController{
            popoverController.delegate = colorPicker
            popoverController.permittedArrowDirections = .any
            popoverController.sourceView = sender
            popoverController.sourceRect = sender.bounds
        }
        controller?.present(colorPicker, animated: true, completion: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - Public functions
    public func configure(parentVC: UIViewController, selectedColorHandler: @escaping (UIColor) -> Void) {
        self.controller = parentVC
        selectedColorHandler(chooseColorButton.tintColor)
        colorPicker.selectedColor = { color in
            self.chooseColorButton.tintColor = color
            selectedColorHandler(color)
        }
    }
}
