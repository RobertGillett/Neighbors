//
//  IncidentTableViewCell.swift
//  Neighbors
//
//  Created by Robert Gillett on 2/5/20.
//  Copyright © 2020 Robert Gillett. All rights reserved.
//

import UIKit
import AVKit


enum IncidentCellAction: String {
    case More
    case Like
    case Comment
    case Share
}

class IncidentTableViewCell: UITableViewCell {


    @IBOutlet weak var commentsCountLabel: UILabel!
    @IBOutlet weak var likesCountLabel: UILabel!
    @IBOutlet weak var viewsCountLabel: UILabel!
    @IBOutlet weak var timeAgoLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var helpfulButton: UIButton!
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var videoPlayerView: VideoPlayerView!
    
    var handleCellAction: ((IncidentCellAction) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellView.layer.cornerRadius = 8
        cellView.layer.shadowColor = UIColor.label.cgColor
        cellView.layer.shadowOpacity = 0.15
        cellView.layer.shadowRadius = 4
        
        self.shareButton.addTarget(self, action: #selector(self.tappedShare), for: .touchUpInside)
        self.commentButton.addTarget(self, action: #selector(self.tappedComment), for: .touchUpInside)
        self.helpfulButton.addTarget(self, action: #selector(self.tappedLike), for: .touchUpInside)
        self.moreButton.addTarget(self, action: #selector(self.tappedMore), for: .touchUpInside)
                
    }
    
    func configure(handleCellAction: @escaping((IncidentCellAction) -> Void)) {
        self.bodyLabel.text = "Stole two packages from our home. One in front of the door and another on our patio....inside the gate."
        let urls = ["https://share.ring.com/6788467661310281222_stamp.mp4", "https://share.ring.com/6789738310202085886_stamp.mp4", "https://share.ring.com/6789030572600513206_stamp.mp4", "https://share.ring.com/6787957024057695392_stamp.mp4", "https://share.ring.com/6788467661310281222_stamp.mp4"]
        self.handleCellAction = handleCellAction
       guard let url = URL(string : urls[Int.random(in: 0..<urls.count)]) else {return}
        self.videoPlayerView.play(for: url)
        
        self.viewsCountLabel.text = Int.random(in: 0..<10).string
        self.likesCountLabel.text = Int.random(in: 0..<10).string
        self.commentsCountLabel.text = Int.random(in: 0..<10).string
//        if self.videoPlayerView.playerLayer.pla
//        self.videoPlayerView.setupLayer(url)
//        self.videoPlayerView.player?.play()
        
    }
    
    @objc
    func tappedMore() {
        self.handleCellAction?(.More)
    }
    @objc
    func tappedLike() {
        self.handleCellAction?(.Like)
    }
    
    @objc
    func tappedComment() {
        self.handleCellAction?(.Comment)
    }
    
    @objc
    func tappedShare() {
        self.handleCellAction?(.Share)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension IncidentTableViewCell {
    static var nibReuseId = "IncidentTableViewCell"
    static func registerNibCell(_ tableView: UITableView) {
        tableView.register(UINib(nibName:IncidentTableViewCell.nibReuseId, bundle: nil), forCellReuseIdentifier: IncidentTableViewCell.nibReuseId)
    }
}


class IncidentCell: UITableViewCell {

    @IBOutlet weak var commentsCountLabel: UILabel!
    @IBOutlet weak var likesCountLabel: UILabel!
    @IBOutlet weak var viewsCountLabel: UILabel!
    @IBOutlet weak var timeAgoLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var helpfulButton: UIButton!
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var authorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellView.layer.cornerRadius = 12
        cellView.layer.shadowColor = UIColor.label.cgColor
        cellView.layer.shadowOpacity = 0.4
        cellView.layer.shadowOffset = CGSize(width: 8, height: 8)
        // Initialization code
    }
    
}

