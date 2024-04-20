import UIKit

final class HomeViewController: BaseTableViewController {
    var tweets = ["one", "two", "three"]
}

extension HomeViewController {
    override func setupViews() {
        super.setupViews()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
}

extension HomeViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tweets.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = tweets[indexPath.row]
        return cell
    }
}
