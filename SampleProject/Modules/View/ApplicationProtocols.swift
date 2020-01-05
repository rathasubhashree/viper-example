import UIKit

/* Presenter calls this protocol and view will listen and will have actual implementation */
protocol ApplicationPresenterToViewProtocol {
    func show(_ apps: ApplicationList)
    func showError()
}

/* View calls this protocol and presenter will listen and will have actual implementation */
protocol ApplicationViewToPresenterProtocol {
    func updateView()
}

/* Presenter calls this protocol and Interactor will listen and will have actual implementation */
protocol ApplicationPresenterToInteractorProtocol {
    var presenter: ApplicationInteractorToPresenterProtocol? { get set }
    func fetchApplicationDetails()
}

/* Interactor calls this protocol and Presenter will listen and will have actual implementation */
protocol ApplicationInteractorToPresenterProtocol {
    func fetched(_ applicationList: ApplicationList)
    func fetchingFailed()
}

/* Presenter calls this protocol and Router will listen and will have actual implementation */
protocol ApplicationPresenterToRouterProtocol {
}
