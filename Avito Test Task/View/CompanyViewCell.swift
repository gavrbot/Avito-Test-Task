//
//  CompanyViewCell.swift
//  Avito Test Task
//
//  Created by Александр Гаврилов on 31.10.2022.
//

import UIKit

class CompanyViewCell: UITableViewCell {
    
    static let identifier = "CompanyViewCell"
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private var employeesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(nameLabel)
        addSubview(employeesLabel)
        
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been initialized")
    }
    
    private func applyConstraints() {
        let safeArea = safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10),
            nameLabel.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: 30),
            
            employeesLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            employeesLabel.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: 30),
        ])
    }
    
    public func configure(with company: Company) {
        nameLabel.text = company.name
        employeesLabel.text = "Number of employees: \(company.employees.count)"
    }
}
