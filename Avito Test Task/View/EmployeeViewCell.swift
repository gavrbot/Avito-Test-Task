//
//  EmployeeTableViewCell.swift
//  Avito Test Task
//
//  Created by Александр Гаврилов on 28.10.2022.
//

import Foundation
import UIKit

class EmployeeViewCell: UITableViewCell {
    
    static let identifier = "EmployeeViewCell"
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var numberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var skillsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(nameLabel)
        addSubview(numberLabel)
        addSubview(skillsLabel)
        
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
            
            numberLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            numberLabel.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: 30),

            
            skillsLabel.topAnchor.constraint(equalTo: numberLabel.bottomAnchor, constant: 10),
            skillsLabel.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: 30),
            skillsLabel.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
        ])
    }
    
    public func configure(with employee: Employee) {
        nameLabel.text = "Name: \(employee.name)"
        numberLabel.text = "Phone number: \(employee.phone_number)"
        skillsLabel.text = "Skills: \(employee.skills.joined(separator: ", "))"
    }
}
