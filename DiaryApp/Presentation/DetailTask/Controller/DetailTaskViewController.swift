//
//  DetailTaskViewController.swift
//  DiaryApp
//
//  Created by Ильдар Арсламбеков on 27.10.2021.
//

import UIKit
import CalendarKit

class DetailTaskViewController: UIViewController {

    //MARK: - Properties
    var event: Event?
    var taskTable: DayViewController?
    let model: DetailTaskModel = DetailTaskModel()
    
    //MARK: - IBOutlets
    @IBOutlet var detailTaskView: DetailTaskView!
    @IBOutlet weak var detailTaskTableView: UITableView!
    
    //MARK: - IBActions
    @IBAction func deleteButtonPressed(_ sender: Any) {
        model.deleteEvent(event: event!)
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        detailTaskView.event = event
        configureDetailTaskView()
        configureModel()
    }
    
    //MARK: - Private Functions
    private func configureModel() {
        model.rootVC = self
        model.taskTable = taskTable
    }
    
    private func configureDetailTaskView() {
        detailTaskTableView.delegate = detailTaskView
        detailTaskTableView.dataSource = detailTaskView
        detailTaskTableView.register(UINib(nibName: "LabelCellTableViewCell", bundle: nil), forCellReuseIdentifier: "labelCell")
        detailTaskTableView.register(UINib(nibName: "ColorTableViewCell", bundle: nil), forCellReuseIdentifier: "colorCell")
    }
}
