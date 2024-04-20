import UIKit

final class HomeViewController: BaseTableViewController {
}

extension HomeViewController {
    override func setupViews() {
        super.setupViews()
        tableView.register(HomeCell.self, forCellReuseIdentifier: HomeCell.identifier)
    }
}

extension HomeViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeCell.identifier, for: indexPath) as? HomeCell else { fatalError() }
        return cell
    }
}