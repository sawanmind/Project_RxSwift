//
//  ViewController.swift
//  Project_RxSwift
//
//  Created by iOS Development on 7/11/18.
//  Copyright © 2018 Genisys. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    private let disposeBag = DisposeBag()
    private let dataModel : Variable<[Model]> = Variable(Model.array)
    private let tableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "RxSwift"
        setupTableView()
        setupCellConfriguration()
        updateTable()
        setupBarItemNumberObserver()
       
    }

    private func setupTableView(){
        tableView.rx.base.register(Cell.self, forCellReuseIdentifier: Cell.Identifier)
        tableView.rx.base.rowHeight = 51
        view.addSubview(tableView)
        tableView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
    }
    
    
    private func setupCellConfriguration(){
        dataModel.asObservable().bind(to: tableView.rx.items(cellIdentifier: Cell.Identifier , cellType: Cell.self))
        { row, data, cell in
            cell.cellConfriguration(data: data)
        }.disposed(by: disposeBag)
 
    }
    
 

    private func updateTable(){
        DispatchQueue.global(qos: .background).asyncAfter(deadline: DispatchTime.now() + 1) {
            self.dataModel.value.append(Model(titleLabel: "Title", detailLabel: "Detail"))
            DispatchQueue.global(qos: .background).asyncAfter(deadline: DispatchTime.now() + 1, execute: {
                self.dataModel.value.removeLast()
                self.updateTable()
            })
        }
    }

    
    private func setupBarItemNumberObserver() {
        dataModel.asObservable().subscribe(onNext: {  data in
            DispatchQueue.main.async {
                self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "\(data.count)", style: .plain, target: nil, action: nil)
            }
        }).disposed(by: disposeBag)
            
        
    }
}

