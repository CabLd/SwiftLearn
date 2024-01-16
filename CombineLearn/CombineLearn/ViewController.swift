//
//  ViewController.swift
//  CombineLearn
//
//  Created by yangtz on 2024/1/15.
//

import Combine
import UIKit

class MyCustomTableCell: UITableViewCell {
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemPink
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button;
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(button)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
}

class ViewController: UIViewController, UITableViewDataSource {
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(MyCustomTableCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    private var models = [String]()
    
    var observer: AnyCancellable?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.frame = view.bounds
        
        observer = ApiCaller.shared.fetchCompanies().receive(on: DispatchQueue.main).sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                print("finished")
            case .failure(let error):
                print(error)
            }
        }, receiveValue: { [weak self] value in
            self?.models = value
            self?.tableView.reloadData()
        })
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MyCustomTableCell
        else{
            fatalError()
        }
        cell.textLabel?.text = models[indexPath.row]
        return cell
    }
    

}

