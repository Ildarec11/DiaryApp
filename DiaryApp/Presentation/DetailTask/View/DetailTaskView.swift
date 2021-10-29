//
//  DetailTaskView.swift
//  DiaryApp
//
//  Created by Ильдар Арсламбеков on 27.10.2021.
//

import UIKit
import CalendarKit

class DetailTaskView: UIView {
    
    //MARK: - Properties
    var event: EventDescriptorWrap? = nil
    
    //MARK: - IBOutlets
    @IBOutlet weak var detailTaskTableView: UITableView!
        
    //MARK: - Private funtions
    private func convertStringFromDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        return dateFormatter.string(from: date)
    }
}

extension DetailTaskView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return DetailTaskTableSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = DetailTaskTableSection(rawValue: section) else { return 0 }
        switch section {
        case .NameAndColor:
            return NameAndColor.allCases.count
        case .StartAndFinishDate:
            return StartAndFinishDate.allCases.count
        case .Description:
            return Description.allCases.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let eventWrap = event else { return UITableViewCell() }
        guard let section = DetailTaskTableSection(rawValue: indexPath.section) else { return UITableViewCell() }
        switch section {
        case .NameAndColor:
            guard let nameAndColor = NameAndColor(rawValue: indexPath.row) else { return UITableViewCell() }
            switch nameAndColor {
            case .name:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "labelCell") as? LabelCellTableViewCell else { return UITableViewCell() }
                cell.configure(text: eventWrap.event.text, style: .largeTitle)
                return cell
            case .color:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell") as? ColorTableViewCell else { return UITableViewCell() }
                cell.setColor(eventWrap.event.color)
                return cell
            }
        case .StartAndFinishDate:
            guard let startAndFinishDate = StartAndFinishDate(rawValue: indexPath.row) else { return UITableViewCell() }
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "labelCell") as? LabelCellTableViewCell else { return UITableViewCell() }
            switch startAndFinishDate {
            case .startDate:
                cell.configure(text: "Start date: \(convertStringFromDate(eventWrap.event.startDate))", style: .regular)
                return cell
            case .finishDate:
                cell.configure(text: "End date: \(convertStringFromDate(eventWrap.event.endDate))", style: .regular)
                return cell
            }
        case .Description:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "labelCell") as? LabelCellTableViewCell else { return UITableViewCell() }
            cell.configure(text: eventWrap.description, style: .regular)
            return cell
        }
    }
}



