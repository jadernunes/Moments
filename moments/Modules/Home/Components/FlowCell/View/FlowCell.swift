//
//  FlowCell.swift
//  moments
//
//  Created by Jader Borba Nunes on 23/10/20.
//

import UIKit

final class FlowCell: UITableViewCell {
    
    // MARK: - Attributes
    
    private var viewModel: FlowCellViewModelProtocol?
    
    // MARK: - Life cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Custom methods
    
    private func setupUI() {
        accessoryType = .disclosureIndicator
    }
    
    func configure(viewModel: FlowCellViewModelProtocol) {
        self.viewModel = viewModel
        populateData()
    }
    
    private func populateData() {
        textLabel?.text = viewModel?.flow.title
    }
}
