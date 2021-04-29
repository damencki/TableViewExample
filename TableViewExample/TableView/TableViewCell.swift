//
//  TableViewCell.swift
//  TableViewExample
//
//  Created by Leanid Hubarenka on 29.04.21.
//

import UIKit

class TableViewCell: UITableViewCell {
    private struct Constants {
        static let verticalOffset: CGFloat = 10.0
        static let horizontalOffset: CGFloat = 16.0
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .darkText
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .darkText
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    private lazy var separatorView: UIView = {
        let separatorView = UIView()
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.backgroundColor = .separator
        return separatorView
    }()
    
    private var tapAction: (() -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    
    private func setupUI() {
        selectionStyle = .none
        
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTap)))
        
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.horizontalOffset),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.horizontalOffset),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.verticalOffset)
        ])
        
        contentView.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
                                        descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.horizontalOffset),
                                        descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.horizontalOffset),
                                        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.verticalOffset)]
        )
        
        contentView.addSubview(separatorView)
        NSLayoutConstraint.activate([
                                        separatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                                        separatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                                        separatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                                        separatorView.heightAnchor.constraint(equalToConstant: 1),
                                        separatorView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: Constants.verticalOffset)])
    }
    
    func update(_ model: TableViewCellModel) {
        titleLabel.text = model.title
        descriptionLabel.text = model.description
        tapAction = model.tapAction
    }
    
    @objc private func didTap() {
        tapAction?()
    }
}

