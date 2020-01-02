import Foundation
import Alamofire

class ApplicationAlamofireInteractor: ApplicationPresenterToInteractorProtocol {
    var presenter: ApplicationInteractorToPresenterProtocol?
    let urlString = Constants.urlString

    func fetchApplicationDetails() {
        Alamofire.request(urlString).responseJSON { (response) in
            if response.error != nil {
                self.presenter?.fetchingFailed()
            } else {
                if response.response?.statusCode == 200 {
                    guard let responseData = response.data else {
                        self.presenter?.fetchingFailed()
                        return
                    }
                    do {
                        let decoder = JSONDecoder()
                        let appDetails = try decoder.decode(
                            ApplicationList.self, from: responseData)
                        DispatchQueue.main.async {
                            self.presenter?.fetched(appDetails)
                        }
                    } catch let error as NSError {
                        print(error)
                    }
                } else {
                    self.presenter?.fetchingFailed()
                }
            }
        }
    }
}
