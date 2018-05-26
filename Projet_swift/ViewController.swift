
import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var RobotImage: UIImageView!
    @IBOutlet weak var TextField: UITextField!
    @IBOutlet weak var SendButton: UIButton!
    @IBOutlet weak var SaveButton: UIButton!
    
    var listItem = ListItem()
    
    var item : Item?
    var ImageData : Data?
    var input :String?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func SendText(_ sender: Any) {
        input = TextField.text
        if input != ""
        {
            input=Replacer(input!)
            get_image("https://www.robohash.org/\(input ?? "")", RobotImage)
        }else{
            print("no text")
        }
        
    }
    
    @IBAction func Save(_ sender: UIButton) {
        //create object
        if item != nil
        {
            print("url : "+(item?.URL)!)
            print("text : "+(item?.Text)!)
            
            let TextFoRJson = item?.Text
            let URLForJson = item?.URL
            let ImgData = item?.ImgData
            let Robot = Item(URL: URLForJson!,Text : TextFoRJson!,ImgData:ImgData!)
            
            listItem.add(Robot)
        }
    }
    
    func Replacer(_ string: String)->String
    {
        var newString = string
        newString = newString.replacingOccurrences(of: " ", with: "_", options: .literal, range: nil)
        newString = newString.replacingOccurrences(of: "ë", with: "e", options: .literal, range: nil)
        newString = newString.replacingOccurrences(of: "é", with: "e", options: .literal, range: nil)
        newString = newString.replacingOccurrences(of: "è", with: "e", options: .literal, range: nil)
        newString = newString.replacingOccurrences(of: "à", with: "a", options: .literal, range: nil)
        
        
        return newString
        
    }
    
    func get_image(_ url_str:String, _ imageView:UIImageView)
    {
        let url:URL = URL(string: url_str)!
        let session = URLSession.shared
        let task = session.dataTask(with: url, completionHandler: {
            (
            data, response, error) in
            if data != nil
            {
                let image = UIImage(data: data!)
                self.ImageData = UIImagePNGRepresentation(image!)!
                
                //creation de l'objet pour Json
                self.item = Item(URL:"https://www.robohash.org/\(self.input ?? "")",Text:self.input!,ImgData:self.ImageData!)
                if(image != nil)
                {
                    DispatchQueue.main.async(execute: {
                        
                        imageView.image = image
                        imageView.alpha = 0
                        
                        UIView.animate(withDuration: 2.5, animations: {
                            imageView.alpha = 1.0
                        })
                    })
                }
            }
        })
        
        task.resume()
    }
    //Hide keyboard touching outside keyboard
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //Hide keyboard pressing return
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        TextField.resignFirstResponder()
        return true
    }
}

