//
//  MovieTableViewCell.swift
//  movieSearch_ObjC
//
//  Created by Kamil Wrobel on 9/21/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    //MARK: - properties
    var movie: KWEMovie? {
        didSet{
            updateViews()
        }
    }
    
    
    //MARK: - Outlets
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLable: UILabel!
    @IBOutlet weak var movieRatingLabel: UILabel!
    @IBOutlet weak var movieOverViewTextView: UITextView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    //MARK: - Helper Methods
    func updateViews(){
        guard let movie = movie else {return}
        DispatchQueue.main.async {
            self.movieTitleLable.text = movie.title
            self.movieRatingLabel.text = String(movie.rating)
            self.movieOverViewTextView.text = movie.overView
            
        }
    }

}
