//
//  DetailViewController.swift
//  TestStoriCard
//
//  Created by Nelson Peña Agudelo on 5/08/24.
//

import UIKit

protocol DetailViewControllerProtocol: BaseViewControllerProtocol {
    func showDetail(viewModel: DetailEntity.MovieDetail)
    func loadTrailer(with trailerKey: String?)
    func set(presenter: any DetailPresenterProtocol)
}

class DetailViewController: BaseViewController {
    
    
    @IBOutlet weak var vFirst: UIView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbYear: UILabel!
    @IBOutlet weak var lbLanguage: UILabel!
    @IBOutlet weak var lbAverage: UILabel!
    @IBOutlet weak var vTwo: UIView!
    @IBOutlet weak var lbTagLine: UILabel!
    @IBOutlet weak var ivBackground: UIImageView!
    @IBOutlet weak var lbOverviewTittle: UILabel!
    @IBOutlet weak var vGradient: UIView!
    @IBOutlet weak var lbOverview: UILabel!
    @IBOutlet weak var vThree: UIView!
    @IBOutlet weak var btSeeTrailer: UIButton!
    
    private var presenter: DetailPresenterProtocol?
    private var viewModel: DetailEntity.MovieDetail?
    private var keyVideo: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        setupNavigationBar()
        presenter?.getDetail()
    }
    
    private func configView() {
        title = "title_detail".localized
        lbTitle.config(font: .caviarDreamsRegularXXXL(), color: .whiteApp)
        lbYear.config(font: .caviarDreamsRegularS(), color: .main)
        lbLanguage.config(font: .caviarDreamsRegularS(), color: .main)
        lbAverage.config(font: .caviarDreamsRegularS(), color: .whiteApp)
        lbTagLine.config(font: .caviarDreamsRegularM(), color: .whiteApp)
        lbOverviewTittle.config(font: .caviarDreamsRegularL(), color: .whiteApp)
        lbOverview.config(font: .caviarDreamsRegularS(), color: .whiteApp)
        lbTagLine.numberOfLines = 0
        view.backgroundColor = .whiteApp
        vThree.layer.cornerRadius = 4
        vThree.backgroundColor = .backgroundDetail
        vTwo.backgroundColor = .backgroundDetail
        vFirst.backgroundColor = .backgroundDetailMain
        vTwo.layer.cornerRadius = 4
        vFirst.layer.cornerRadius = 4
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        vGradient.layer.insertSublayer(gradient, at: 0)
        btSeeTrailer.layer.borderColor = UIColor.whiteApp.cgColor
        btSeeTrailer.layer.borderWidth = 1
        btSeeTrailer.layer.cornerRadius = 5
        btSeeTrailer.setTitle("title_button_trilers".localized, for: .normal)
        btSeeTrailer.setTitle("title_button_no_trilers".localized, for: .disabled)
        btSeeTrailer.addTarget(self, action: #selector(showTrailerAction), for: .touchUpInside)
        btSeeTrailer.tintColor = .whiteApp
        btSeeTrailer.setTitleColor(.whiteApp, for: .normal)
        btSeeTrailer.setTitleColor(.whiteApp, for: .disabled)
        view.layoutSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if let gradientLayer = vGradient.layer.sublayers?.first as? CAGradientLayer {
            gradientLayer.frame = vGradient.bounds
        }
    }
    
    func setupNavigationBar()  {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.whiteApp]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.whiteApp]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        guard let navigationController = self.navigationController else { return }
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.tintColor = UIColor.whiteApp
    }
    
    @objc func showTrailerAction(sender: UIButton) {
        guard let keyVideo = keyVideo else {
            return
        }
        presenter?.showTrailer(with: keyVideo)
    }
    
}


extension DetailViewController: DetailViewControllerProtocol {
    
    func set(presenter: any DetailPresenterProtocol) {
        self.presenter = presenter
    }
    
    func showDetail(viewModel: DetailEntity.MovieDetail) {
        ivBackground.downloaded(from: viewModel.posterPath, contentMode: .scaleToFill)
        lbAverage.text = viewModel.voteAverage
        lbYear.text = viewModel.releaseDate
        lbTitle.text = viewModel.title
        lbLanguage.text = viewModel.originalLanguage
        lbTagLine.text = viewModel.tagline
        lbOverview.text = viewModel.overview
    }
    
    func loadTrailer(with trailerKey: String?) {
        guard let trailerKey = trailerKey else {
            btSeeTrailer.alpha = 0.3
            btSeeTrailer.isEnabled = false
            return
        }
        self.keyVideo = trailerKey
    }
}
