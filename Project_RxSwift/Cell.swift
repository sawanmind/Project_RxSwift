//
//  Cell.swift
//  Project_RxSwift
//
//  Created by iOS Development on 7/11/18.
//  Copyright © 2018 Genisys. All rights reserved.
//

import Foundation
import UIKit


class Cell: UITableViewCell {
    
    static let Identifier = "Cell"
    
    func cellConfriguration(data:Model){
        self.titleLabel.text = data.titleLabel
        self.detailLabel.text = data.detailLabel
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupViews(){
   
        contentView.addSubview(titleLabel)
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 15).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor,constant: -15).isActive = true
        titleLabel.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor,constant:0).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: titleLabel.heightAnchor).isActive = true
        
        
        contentView.addSubview(detailLabel)
        detailLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 15).isActive = true
        detailLabel.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor,constant: -15).isActive = true
        detailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant:4.5).isActive = true
        detailLabel.heightAnchor.constraint(equalTo: detailLabel.heightAnchor).isActive = true
        
    }
    

    
    
   fileprivate let titleLabel : UILabel = {
        let textlabel = UILabel()
        textlabel.textColor = UIColor.black.withAlphaComponent(0.8)
        textlabel.font = UIFont.systemFont(ofSize: 14)
        textlabel.translatesAutoresizingMaskIntoConstraints = false
        return textlabel
    }()

   fileprivate let detailLabel : UILabel = {
        let textlabel = UILabel()
        textlabel.textColor = UIColor.gray.withAlphaComponent(0.8)
        textlabel.font = UIFont.systemFont(ofSize: 12)
        textlabel.translatesAutoresizingMaskIntoConstraints = false
        return textlabel
    }()

}

