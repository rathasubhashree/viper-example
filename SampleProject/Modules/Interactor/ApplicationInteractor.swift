import Foundation

class ApplicationInteractor: ApplicationPresenterToInteractorProtocol {

    var presenter: ApplicationInteractorToPresenterProtocol?
    let urlString = Constants.urlString

    func fetchApplicationDetails() {
        let url = urlString
        let urlSessionObj: URLSession = URLSession(configuration: .default)
        var urlReq = URLRequest(url: URL(string: url)!)
        urlReq.httpMethod = "GET"
        var dataTask = URLSessionDataTask()
        dataTask = urlSessionObj.dataTask(with: urlReq, completionHandler: { (data, _, error) in
            if error != nil {
                print("Network Connection Failed")
                self.presenter?.fetchingFailed()
            } else {
                do {
                    if let responseData = data {
                        let decoder = JSONDecoder()
                        let appDetails = try decoder.decode(
                            ApplicationList.self, from: responseData)
                        DispatchQueue.main.async {
                            self.presenter?.fetched(appDetails)
                        }
                    }
                } catch {
                    print(error)
                    self.presenter?.fetchingFailed()
                }
            }
        })
        dataTask.resume()
    }
}
