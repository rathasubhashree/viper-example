import UIKit
import AlamofireImage

class ApplicationTableViewController: UITableViewController {

    private let presenter: ApplicationViewToPresenterProtocol

    var applicationDetail: [ApplicationResult] = []

    init(presenter: ApplicationViewToPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupConstraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        presenter.updateView()
    }

    private func setupView() {
        tableView.tableFooterView = UIView()
        tableView.register(ApplicationTableViewCell.self, forCellReuseIdentifier: ApplicationTableViewCell.cellReuseIdentifier)
    }

    private func setupConstraints() {
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return applicationDetail.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ApplicationTableViewCell.cellReuseIdentifier, for: indexPath) as? ApplicationTableViewCell else {
                return UITableViewCell()
        }
        cell.update(appDetails: applicationDetail[indexPath.row])
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let url = URL(string: applicationDetail[indexPath.row].appURL) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ApplicationTableViewController: ApplicationPresenterToViewProtocol {
    func show(_ apps: ApplicationList) {
        applicationDetail = apps.results
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    func showError() {
    }
}
