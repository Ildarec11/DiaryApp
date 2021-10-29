//
//  addTaskView.swift
//  DiaryApp
//
//  Created by Ильдар Арсламбеков on 30.10.2021.
//

import UIKit

class AddTaskView: UIView {
    
    //MARK: - IBoutlets
    
}

extension AddTaskView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return AddTaskSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = AddTaskSection(rawValue: section) else { return 0 }
        switch section {
        case .nameAndDescription:
            return NameAndDescription.allCases.count
        case .colorPicker:
            return 1
        case .startAndEndDates:
            return StartAndFinishDate.allCases.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = AddTaskSection(rawValue: indexPath.section) else { return UITableViewCell() }
        switch section {
        case .nameAndDescription:
            guard let row = NameAndDescription(rawValue: indexPath.row) else { return UITableViewCell() }
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "textFieldCell") as? TextFieldTableViewCell else { return UITableViewCell() }
            switch row {
            case .name:
                cell.configure()
                return cell
            case .description:
                cell.configure()
                return cell
            }
        case .colorPicker:
            
        case .startAndEndDates:
            <#code#>
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        <#code#>
    }
    
}
