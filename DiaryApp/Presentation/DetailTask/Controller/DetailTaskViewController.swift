//
//  DetailTaskViewController.swift
//  DiaryApp
//
//  Created by Ильдар Арсламбеков on 27.10.2021.
//

import UIKit

class DetailTaskViewController: UIViewController {

    //MARK: - Properties
    var detailTaskModel = DetailTaskModel()
    var task: Task?
    
    //MARK: - IBOutlets
    @IBOutlet var detailTaskView: DetailTaskView!

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Private Functions
    private func configureDetailTaskView() {
        if let task = task {
            detailTaskView.configure(task: task)
        }
        detailTaskView.taskNameTextView.delegate = detailTaskModel
        detailTaskView.descriptionTextView.delegate = detailTaskModel
    }
}
