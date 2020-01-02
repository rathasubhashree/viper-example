import UIKit

protocol ApplicationPresenterToViewProtocol {
    func show(_ apps: ApplicationList)
    func showError()
}

protocol ApplicationViewToPresenterProtocol {
    func updateView()
}

protocol ApplicationPresenterToInteractorProtocol {
    var presenter: ApplicationInteractorToPresenterProtocol? { get set }
    func fetchApplicationDetails()
}

protocol ApplicationInteractorToPresenterProtocol {
    func fetched(_ applicationList: ApplicationList)
    func fetchingFailed()
}

protocol ApplicationPresenterToRouterProtocol {
}
