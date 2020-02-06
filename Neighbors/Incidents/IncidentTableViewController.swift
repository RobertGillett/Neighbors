//
//  IncidentTableViewController.swift
//  Neighbors
//
//  Created by Robert Gillett on 2/5/20.
//  Copyright © 2020 Robert Gillett. All rights reserved.
//

import UIKit

class IncidentTableViewController: UITableViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Neighborhood"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.configureMenuButton()
        self.makeFilterHeader()
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 200
        IncidentTableViewCell.registerNibCell(self.tableView)
        self.tableView.separatorStyle = .none
        let rc = UIRefreshControl()
        rc.addTarget(self, action: #selector(self.refresh), for: .valueChanged)
        self.tableView.refreshControl = rc
        self.tableView.reloadData()
    }
    func makeFilterHeader() {
        let filter = IncidentFilterView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 54))
        let v = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 60))
        self.tableView.tableHeaderView = v
       //tableView.tableHeaderView?.backgroundColor = .blue
        self.tableView.tableHeaderView?.addSubview(filter)
        filter.constrainToParent()
        filter.setup()
}
    func configureMenuButton() {
        let menuButton = UIBarButtonItem(image: SFSymbol.lineHorizontal3.image, style: .plain, target: self, action: #selector(self.tappedMenu))
        let profileButton = UIBarButtonItem(image: SFSymbol.personCircle.image, style: .plain, target: self, action: #selector(self.tappedProfile))
        self.navigationItem.setRightBarButton(profileButton, animated: false)
//        self.navigationItem.setLeftBarButton(menuButton, animated: false)
    }
    
    @objc
    func refresh() {
        self.tableView.refreshControl?.endRefreshing()
    }
    
    @objc
    func tappedMenu() {
        
    }
    
    @objc
    func tappedProfile() {
        
    }
    
    func showActionSheet(_ incident: Incident?) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let share = UIAlertAction(title: "Share", style: .default) {[weak self] (_ ) in
        
        }
        let definitions = UIAlertAction(title: "Category Definitions", style: .default) {[weak self] (_ ) in
            DispatchQueue.main.async {
                self?.present(IncidentTypesTableViewController.instnatiateWithNavController(), animated: true, completion: nil)
            }
        }
        let flag = UIAlertAction(title: "Flag", style: .destructive) {[weak self] (_ ) in
            //TO DO: Implement Flag Action
        }
        
        let hide = UIAlertAction(title: "Hide Post", style: .destructive) {[weak self] (_ ) in
            //TO DO: Implement Hide Post Action
        
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(share)
        alert.addAction(definitions)
        alert.addAction(flag)
        alert.addAction(hide)
        alert.addAction(cancel)
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func showShareSheet(_ incident: Incident?) {
        guard let shareUrl = incident?.shareUrl else {return}
        let text = "Just saw this on Neighbors: \(shareUrl)"
        let activity = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        DispatchQueue.main.async {
            self.present(activity, animated: true, completion: nil)
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 100
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IncidentTableViewCell.nibReuseId, for: indexPath) as! IncidentTableViewCell
        cell.configure {[weak self] (action) in
            switch action {
            case .Comment:
                print("handle comment")
                //Handle Comment
            case .Like:
                //Handle Like
                print("handle like")
            case .Share:
                self?.showShareSheet(nil)
            case .More:
                self?.showActionSheet(nil)
            }
        }

        // Configure the cell...

        return cell
    }
}
