//
//  MovieListTableViewController.swift
//  movieSearch_ObjC
//
//  Created by Kamil Wrobel on 9/21/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

import UIKit

class MovieListTableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var movieSearchBar: UISearchBar!
    
    var movieTitles: [KWEMovie]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieSearchBar.delegate = self
        
    }
    
    //MARK: - Delegate Methods
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard movieSearchBar.text != "" else {return}
        let searchTitle = movieSearchBar.text
        
        KWEMovieController.shared().fetchMovieData(searchTitle) { (arrayOfMovies) in
            guard let movies = arrayOfMovies else {return}
            self.movieTitles = movies
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        guard let movies = movieTitles else {return 0}
        return movies.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieTableViewCell else {return UITableViewCell()}
        guard let movies = movieTitles else {return UITableViewCell()}
        let movie  = movies[indexPath.row]
        cell.movie = movie
        return cell
    }
    
    
    
    
    
}
