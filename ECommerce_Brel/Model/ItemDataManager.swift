
import UIKit

class ItemDataManager{
    
    var itemContainer:Items?
    var dictionary = [Int: UIImage?]()
    weak var tableView: UITableView?
    
    init(tableView:UITableView){
        self.tableView = tableView
    }
    
    func loadItems(){
        let stringUrl =  "\(Constants.Heroku.baseAPIURL)\(Constants.HerokuGet.get_items)"
        guard let url = URL(string: stringUrl) else { return }
        URLSession.shared.dataTask(with: url){ (data,response,error) in
            guard let data = data else { return }
            do{
                self.itemContainer = try JSONDecoder().decode(Items.self, from: data)
                DispatchQueue.main.async {
                    self.tableView?.reloadData()
                }
                var count = 0
                for _ in (self.itemContainer?.items)!{
                    self.loadImage(num: count)
                    count += 1
                }
            } catch {
                print(error)
            }
            }.resume()
    }
    
    func loadImage(num:Int){
        let imageName:String? = itemContainer?.items[num].pictUrl
        guard let imageURL = URL(string: "\(Constants.Heroku.baseAPIURL)\(Constants.Heroku.pictureFolder)\(imageName!)") else {return}
        print(imageURL)
        URLSession.shared.dataTask(with: imageURL){ (data,response,error) in
            guard let data = data else {
                return
            }
            let image = UIImage(data: data as Data)
            let id = self.itemContainer?.items[num].id
            self.dictionary[id!] = image
            DispatchQueue.main.async{
                self.tableView?.reloadData()
            }
        }.resume()
    }
}
