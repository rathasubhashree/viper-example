import UIKit

class ApplicationRouter: ApplicationPresenterToRouterProtocol {
    let presenter: ApplicationPresenter
    var interactor: ApplicationPresenterToInteractorProtocol
    let rootViewController: UINavigationController

    init() {
        presenter = ApplicationPresenter()
        interactor = ApplicationInteractor()
        interactor.presenter = presenter
        let viewController = ApplicationTableViewController(presenter: presenter)
        rootViewController = UINavigationController(rootViewController: viewController)
        presenter.router = self
        presenter.view = viewController
        presenter.interactor = interactor
    }
}
