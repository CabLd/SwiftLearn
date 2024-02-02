//
//  ViewController.swift
//  Async&AwaitLearn
//
//  Created by yangtz on 2024/1/31.
//

import UIKit
struct User: Codable {
    let name: String
}
class ViewController: UIViewController, UITableViewDataSource {
    

    let url = URL(string: "https://jsonplaceholder.typicode.com/users")

    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    var users = [User]()

    enum MyError: Error {
        case failedToGetUsers
    }

    private func fetchUsers() async -> Result<[User], Error> {
        guard let url = url else {
            return .failure(MyError.failedToGetUsers)
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let users = try JSONDecoder().decode([User].self, from: data)
            return .success(users)
        } catch {
            return .failure(error)
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.dataSource = self
        Task.init {
            let result = await fetchUsers()
            switch result {
            case .success(let users):
                self.users = users
                DispatchQueue.main.async {
                    print("finish")
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
        for i in 1..<10 {
            print(i)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = users[indexPath.row].name
        return cell
    }

}

