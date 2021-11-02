//
//  AddTaskViewController.swift
//  DiaryApp
//
//  Created by Ильдар Арсламбеков on 30.10.2021.
//

import UIKit
import CalendarKit

class AddTaskViewController: UIViewController {

    //MARK: - Properties
    let addTaskModel: AddTaskModel = AddTaskModel()
    var eventTable: DayViewController!
    
    //MARK: - IBOutlets
    @IBOutlet var addTaskView: AddTaskView!
    @IBOutlet weak var addTaskTableView: UITableView!
    
    
    //MARK: - IBActions
    @IBAction func addTaskButtonPressed(_ sender: Any) {
        let validateResult = addTaskView.validate(validEventHandler: { event in
            addTaskModel.addEvent(event: event, eventTable: eventTable)
        })
        if validateResult.isValid == false {
            showAlert(title: "Error", message: validateResult.errorMessage ?? "")
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        addTaskView.viewController = self
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        addTaskView.addGestureRecognizer(tap)
    }
    
    //MARK: - Private functions
    private func configureTableView() {
        addTaskTableView.register(UINib(nibName: "DateChooseTableViewCell", bundle: nil), forCellReuseIdentifier: "dateChooseCell")
        addTaskTableView.register(UINib(nibName: "TextViewTableViewCell", bundle: nil), forCellReuseIdentifier: "textFieldCell")
        addTaskTableView.register(UINib(nibName: "AddTaskColorTableViewCell", bundle: nil), forCellReuseIdentifier: "colorPickerCell")
        addTaskTableView.dataSource = addTaskView
    }
    
    private func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: { _ in alertController.dismiss(animated: true, completion: nil) })
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}
