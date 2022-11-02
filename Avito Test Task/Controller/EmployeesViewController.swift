//
//  ViewController.swift
//  Avito Test Task
//
//  Created by Александр Гаврилов on 28.10.2022.
//

import UIKit

class EmployeesViewController: UIViewController {

    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(EmployeeViewCell.self, forCellReuseIdentifier: EmployeeViewCell.identifier)
        return tableView
    }()
    
    private var employees: [Employee]
    
    init(company: Company) {
        self.employees = company.employees.sorted{ $0.name < $1.name }
        super.init(nibName: nil, bundle:  nil)
        title = company.name
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        view.addSubview(tableView)
        tableView.dataSource = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
        
}

extension EmployeesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeViewCell.identifier) as? EmployeeViewCell else {
            return UITableViewCell(style: .default, reuseIdentifier: EmployeeViewCell.identifier)
        }
        cell.configure(with: employees[indexPath.row])
        
        return cell
    }
}

