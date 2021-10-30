//
//  AddTaskViewController.swift
//  DiaryApp
//
//  Created by Ильдар Арсламбеков on 30.10.2021.
//

import UIKit

class AddTaskViewController: UIViewController {

    //MARK: - Properties
    
    //MARK: - IBOutlets
    @IBOutlet var addTaskView: AddTaskView!
    @IBOutlet weak var addTaskTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        addTaskView.viewController = self
    }
    
    //MARK: - Private functions
    private func configureTableView() {
        addTaskTableView.register(UINib(nibName: "DateChooseTableViewCell", bundle: nil), forCellReuseIdentifier: "dateChooseCell")
        addTaskTableView.register(UINib(nibName: "TextViewTableViewCell", bundle: nil), forCellReuseIdentifier: "textFieldCell")
        addTaskTableView.register(UINib(nibName: "AddTaskColorTableViewCell", bundle: nil), forCellReuseIdentifier: "colorPickerCell")
        addTaskTableView.dataSource = addTaskView
        //addTaskTableView.delegate = self
    }
}
