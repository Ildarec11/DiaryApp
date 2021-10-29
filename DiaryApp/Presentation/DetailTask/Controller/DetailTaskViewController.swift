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
    var detailTaskModel = DetailTaskModel()
    var event: EventDescriptor?
    
    //MARK: - IBOutlets
    @IBOutlet var detailTaskView: DetailTaskView!

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        detailTaskView.event = event
        configureDetailTaskView()
    }
    
    //MARK: - Private Functions
    private func configureDetailTaskView() {
        detailTaskView.detailTaskTableView.delegate = detailTaskView
        detailTaskView.detailTaskTableView.dataSource = detailTaskView
        detailTaskView.detailTaskTableView.register(UINib(nibName: "LabelCellTableViewCell", bundle: nil), forCellReuseIdentifier: "labelCell")
        detailTaskView.detailTaskTableView.register(UINib(nibName: "ColorTableViewCell", bundle: nil), forCellReuseIdentifier: "colorCell")
    }
}
