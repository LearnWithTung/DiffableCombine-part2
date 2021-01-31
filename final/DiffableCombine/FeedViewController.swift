//
//  ViewController.swift
//  DiffableCombine
//
//  Created by Tung Vu Duc on 23/01/2021.
//

import UIKit
import Combine

class FeedViewController: UIViewController {
    private var subscriptions = [AnyCancellable]()
    
    @Published var users = [User]()

    @IBOutlet weak var tableView: UITableView!
    
    // 2
    typealias DiffableDataSource = CustomDataSource<Int, User>
    // 3
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, User>

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadPosts()
        

        let dataSource = DiffableDataSource(tableView: tableView) { (tableView, indexPath, user) -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell", for: indexPath) as! FeedCell
            
            cell.configure(with: user)
            
            return cell
        }
        
        $users
            .receive(on: DispatchQueue.main)
            .sink {[weak self] (_) in
                self?.applySnapshot(to: dataSource)
            }
            .store(in: &subscriptions)
        
        tableView.delegate = dataSource
        dataSource.delegate = self
    }
    
    private func applySnapshot(to dataSource: DiffableDataSource) {
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(users)
        dataSource.apply(snapshot)
    }
    
    private func loadPosts(){
        APIService.shared.fetchUsers()
            .sink { (error) in
                // handle error
            } receiveValue: { (users) in
                self.users = users
            }
            .store(in: &subscriptions)
    }


}

extension FeedViewController: DataSourceDeletionDelegate {
    func deleteRow(at indexPath: IndexPath) {
        users.remove(at: indexPath.row)
    }
}

