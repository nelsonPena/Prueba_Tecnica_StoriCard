//
//  BaseTableViewController.swift
//  TestStoriCard
//
//  Created by Nelson Peña Agudelo on 4/08/24.
//

import UIKit

protocol BaseTableViewDataSource: UITableViewDataSource {
    func numberOfRows(tableView: UITableView, section: Int) -> Int
}


class BaseTableViewController: BaseViewController, BaseTableViewDataSource {

    static let paddingEmptyLabel: CGFloat = 20.0
    
    // MARK: - Properties
    
    private var paginationState = PaginationState()
    private var noDataLabels: [Int:UILabel] = [:]
    
    // MARK: Pagination
    // To use pagination capabilities you must call activatePagination() and you must override nextPageTriggered (in this method you would want to ask for new data). Both of these things are done in your UIViewController child class.
    // You will also have to notify when the data has arrived with nextPageLoaded(). And when no new data is available you'll have to call lastPageLoaded()
    // You can also make use of the struct PaginationCoordinator on your interactor, to better handle the logic of the currentPage, the number of items per page and the next page.
    
    func nextPageTriggered() {
        print("Please override this method to incorporate pagination functionality.")
    }
    
    func nextPageLoaded() {
        paginationState.isLoading = false
    }
    
    func lastPageLoaded() {
        paginationState.isFinished = true
    }
    
    func getLastPageLoaded() -> Bool{
        return paginationState.isFinished
    }
    
    func activatePagination() {
        paginationState.isActive = true
    }
    
    func disablePagination() {
        paginationState.isActive = false
    }
    
    func resetPagination() {
        paginationState.isFinished = false
    }
    
    @objc func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard paginationState.isActive else { return }
        
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if !paginationState.isLoading && !paginationState.isFinished && offsetY > contentHeight - scrollView.frame.size.height {
            paginationState.isLoading = true
            nextPageTriggered()
        }
    }
}

extension BaseTableViewController {
    
    // MARK: - BaseTableViewDataSource
    
    func numberOfRows(tableView: UITableView, section: Int) -> Int {
        return 0
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let numberOfRows = self.numberOfRows(tableView: tableView, section: section)
        return numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
    
}

