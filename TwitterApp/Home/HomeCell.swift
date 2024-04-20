import UIKit

final class HomeCell: BaseTableViewCell {
    static let identifier = "HomeCell"
    
    private let avatarImageView: UIImageView = {
        $0.backgroundColor = .systemRed
        $0.layer.cornerRadius = 25
        $0.layer.masksToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
}

extension HomeCell {
    override func setupViews() {
        [avatarImageView].forEach { contentView.addSubview($0)}
    }
    
    override func setupConstraints() {
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14),
            contentView.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 14),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            avatarImageView.widthAnchor.constraint(equalToConstant: 50),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor)
        ])
    }
}
