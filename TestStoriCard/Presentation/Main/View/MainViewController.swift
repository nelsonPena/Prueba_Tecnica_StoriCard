//
//  MainViewViewController.swift
//  TestStoriCard
//
//  Created by Nelson Peña Agudelo on 3/08/24.
//

import UIKit
import SkeletonView

protocol MainViewControllerProtocol: BaseViewControllerProtocol {
    func set(presenter: MainPresenterProtocol)
    func showMovies(items: MovieItems)
    func startSkeletonLoading(animated: Bool)
}

class MainViewController: BaseTableViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var presenter: MainPresenterProtocol?
    private var movieItems: MovieItems = []
    var currentIndex: Int = 0
    override var isLoading: Bool {
        set {
            super.isLoading = newValue
        }
        get {
            return super.isLoading
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        presenter?.loadTable()
    }
    
    private func configView() {
        title = "movies_main_title".localized
        
        tableView.register(UINib(nibName: MovieCell.nibName, bundle: nil), forCellReuseIdentifier: MovieCell.cellIdentifier)
        tableView.register(UINib(nibName: MovieSkeletonCell.nibName, bundle: nil), forCellReuseIdentifier: MovieSkeletonCell.cellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isSkeletonable = true
        activatePagination()
    }
    
    override func nextPageTriggered() {
        tableView.startPaginationSkeletonLoading()
        presenter?.nextPageTriggered()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = movieItems[indexPath.item]
        guard let movieCell = tableView.dequeueReusableCell(withIdentifier: MovieCell.cellIdentifier) as? MovieCell else {
            return MovieCell()
        }
        movieCell.config(cellViewModel: cellViewModel)
        return movieCell
    }
}

extension MainViewController: SkeletonTableViewDataSource {
    
    // MARK: - SkeletonTableViewDataSource
    
    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return MovieSkeletonCell.cellIdentifier
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieId = movieItems[indexPath.item].movieId
        presenter?.showDetail(with: movieId)
    }
}

extension MainViewController: MainViewControllerProtocol {
    
    func startSkeletonLoading(animated: Bool) {
        isLoading = true
        if animated { tableView.startSkeletonAnimation() }
        tableView.showSkeleton()
    }
    
    func showMovies(items: MovieItems) {
        movieItems = items
        tableView.reloadData()
    }
    
    func set(presenter: any MainPresenterProtocol) {
        self.presenter = presenter
    }
    
    func appendMovies(_ items: MovieItems, reseted: Bool) {
        tableView.hideSkeleton()

        self.tableView.reloadSections(NSIndexSet(index: 0) as IndexSet, with: .none)

        // we have to do this because mdw can't tell us if it's the last page
        if items.isEmpty && !reseted {
            lastPageLoaded()
        }
        else {
            nextPageLoaded()
            
            let numOfCellsBeforeChange = movieItems.count

            if reseted { movieItems = [] }
            
            movieItems.append(contentsOf: items)
            
            if items.isEmpty {
                lastPageLoaded()
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    self.tableView.reloadSections(NSIndexSet(index: 0) as IndexSet, with: .automatic)
                }
            }
            tableView.changeCells(numCellsBeforeChange: numOfCellsBeforeChange, elementsBeingAppended: items, allElements: movieItems, section: 0, onlyInsert: !reseted)
        }
    }
}
