//
//  MovieCell.swift
//  TestStoriCard
//
//  Created by Nelson Peña Agudelo on 4/08/24.
//

import UIKit

class MovieCell: UITableViewCell {
    
    static let nibName = "MovieCell"
    static let cellIdentifier = "MovieCellReuseIdentifier"
    
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var ivIconPopularity: UIImageView!
    @IBOutlet weak var lbPopularity: UILabel!
    @IBOutlet weak var ivThumbnail: UIImageView!
    @IBOutlet weak var lbReleaseDate: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        lbTitle.config(font: .caviarDreamsRegularM(), color: .main)
        lbReleaseDate.config(font: .caviarDreamsRegularS(), color: .secundary)
        lbPopularity.config(font: .caviarDreamsRegularXS(), color: .secundary)
        ivIconPopularity.tintColor = .main
        ivThumbnail.image = UIImage.init(systemName: "photo")
        ivThumbnail.tintColor = .backgroundDetail
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func config(cellViewModel: MainEntity.MovieItem) {
        lbTitle.text = cellViewModel.title
        lbReleaseDate.text = cellViewModel.releaseDate
        ivThumbnail.downloaded(from: cellViewModel.posterPath)
        lbPopularity.text = cellViewModel.popularity
    }
}
