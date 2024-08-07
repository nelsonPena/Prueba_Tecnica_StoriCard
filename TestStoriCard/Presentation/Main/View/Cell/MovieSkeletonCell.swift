//
//  MovieSkeletonCell.swift
//  TestStoriCard
//
//  Created by Nelson Peña Agudelo on 4/08/24.
//

import UIKit

protocol SkeletonCell { }

class MovieSkeletonCell: UITableViewCell, SkeletonCell {
    // MARK: Properties
    
    static let nibName = "MovieSkeletonCell"
    static let cellIdentifier = "MovieSkeletonCellReuseIdentifier"
    
    @IBOutlet weak var skeletonCellView: SkeletonCellView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
