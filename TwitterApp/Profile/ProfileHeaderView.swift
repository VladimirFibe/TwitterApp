import UIKit

final class ProfileHeaderView: BaseView {
    private let headerImageView: UIImageView = {
        $0.image = .header
        $0.contentMode = .scaleAspectFill
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
}

extension ProfileHeaderView {
    override func setupViews() {
        [headerImageView].forEach { addSubview($0)}
    }
    
    override func setupConstraints() {
        NSLayoutConstraint.activate([
            headerImageView.topAnchor.constraint(equalTo: topAnchor),
            headerImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerImageView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
}
