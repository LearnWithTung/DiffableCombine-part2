//
//  CustomDataSource.swift
//  DiffableCombine
//
//  Created by Tung Vu Duc on 31/01/2021.
//

import UIKit

protocol DataSourceDeletionDelegate: class {
    func deleteRow(at indexPath: IndexPath)
}

class CustomDataSource<Section: Hashable, Cell: Hashable>: UITableViewDiffableDataSource<Section, Cell>, UITableViewDelegate {
    weak var delegate: DataSourceDeletionDelegate?

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {  (contextualAction, view, boolValue) in
            self.deleteData(at: indexPath)
        }

        let editAction = UIContextualAction(style: .normal, title: "Edit") {  (contextualAction, view, boolValue) in
            self.editData(at: indexPath)
        }
        editAction.backgroundColor = .orange
        let swipeActions = UISwipeActionsConfiguration(actions: [deleteAction,editAction])

        return swipeActions
    }

    func deleteData(at indexPath: IndexPath) {
        delegate?.deleteRow(at: indexPath)
    }

    func editData(at indexPath: IndexPath) {
        print(indexPath.row)
    }

}


