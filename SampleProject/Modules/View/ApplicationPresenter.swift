class ApplicationPresenter {
    var router: ApplicationPresenterToRouterProtocol?
    var view: ApplicationPresenterToViewProtocol?
    var interactor: ApplicationPresenterToInteractorProtocol?
}

extension ApplicationPresenter: ApplicationViewToPresenterProtocol {
    func updateView() {
        interactor?.fetchApplicationDetails()
    }
}

extension ApplicationPresenter: ApplicationInteractorToPresenterProtocol {

    func fetched(_ applicationList: ApplicationList) {
        self.view?.show(applicationList)
    }

    func fetchingFailed() {
        self.view?.showError()
    }
}
