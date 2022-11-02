//
//  CompanyViewController.swift
//  Avito Test Task
//
//  Created by Александр Гаврилов on 31.10.2022.
//

import UIKit

class CompanyViewController: UIViewController {

    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CompanyViewCell.self, forCellReuseIdentifier: CompanyViewCell.identifier)
        return tableView
    }()
    
    private var company = Company(name: "", employees: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        title = "Companies"
        
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        
        getCompanyWithEmployees()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func getCompanyWithEmployees() {
        APICaller.shared.getCompanyWithEmployees { [weak self] result in
            switch result {
                case .success(let company):
                    self?.company = company
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        let alertController = UIAlertController(title: "Network error", message: error.localizedDescription, preferredStyle: .alert)
                        let cancelButton = UIAlertAction(title: "Cancel", style: .default, handler: nil)
                        alertController.addAction(cancelButton)
                        self?.present(alertController, animated: true, completion: nil)
                    }
            }
        }
    }
    
}

extension CompanyViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CompanyViewCell.identifier) as? CompanyViewCell else {
            return UITableViewCell(style: .default, reuseIdentifier: CompanyViewCell.identifier)
        }
        cell.configure(with: self.company)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = EmployeesViewController(company: self.company)
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}

