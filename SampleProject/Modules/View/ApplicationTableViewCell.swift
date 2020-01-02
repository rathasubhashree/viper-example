import UIKit

class ApplicationTableViewCell: UITableViewCell {
    static let cellReuseIdentifier = "ApplicationTableViewCell"
    private let appImageView = UIImageView()
    private let appName = UILabel()
    private let appURL = UILabel()
    private let appArtistName = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupView()
        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func update(appDetails: ApplicationResult) {
        appName.text = appDetails.applicationName
        if let url = URL(string: appDetails.appImage) {
            appImageView.af_setImage(withURL: url)
        }
        appURL.text = appDetails.appURL
        appArtistName.text = appDetails.artistName
    }

    func setupView() {
        contentView.addSubview(appName)
        appName.font = UIFont.boldSystemFont(ofSize: 25)
        appName.numberOfLines = 0
        appName.textAlignment = .center
        appName.textColor = .black

        contentView.addSubview(appImageView)
        appImageView.contentMode = .scaleToFill

        contentView.addSubview(appURL)
        appURL.font = UIFont.preferredFont(forTextStyle: .footnote)
        appURL.numberOfLines = 0
        appURL.textAlignment = .center
        appURL.textColor = UIColor.blue

        contentView.addSubview(appArtistName)
        appArtistName.font = UIFont.preferredFont(forTextStyle: .body)
        appArtistName.textColor = UIColor.gray
        appArtistName.textAlignment = .center
        appArtistName.numberOfLines = 0
    }

    func setupConstraints() {
        appName.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.centerX.equalToSuperview()
        }

        appImageView.snp.makeConstraints { (make) in
            make.top.equalTo(appName.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(appImageView.snp.width)
            make.centerX.equalToSuperview()
        }

        appURL.snp.makeConstraints { (make) in
            make.top.equalTo(appImageView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.centerX.equalToSuperview()
        }

        appArtistName.snp.makeConstraints { (make) in
            make.top.equalTo(appURL.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.centerX.equalToSuperview()
            make.bottom.lessThanOrEqualToSuperview().inset(16)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
