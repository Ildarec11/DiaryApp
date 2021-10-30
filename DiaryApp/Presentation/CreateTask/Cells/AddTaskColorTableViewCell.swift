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
        picker.allColors = [#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1), #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1), #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1), #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)]
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
        colorPicker.selectedColor = { color in
            self.chooseColorButton.tintColor = color
            selectedColorHandler(color)
        }
    }
}
