
import UIKit
import AlamofireImage
import Alamofire

@IBDesignable
class BaseImageView: UIImageView {

    @IBInspectable var borderColor: UIColor = UIColor.clear
        {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            clipsToBounds = true
        }
    }
    
    func loadImage(url:String?) -> Void {
        self.loadImage(url: url, progress: nil, completion: nil)
    }
    
    func loadImage(url: String?, progress: ImageDownloader.ProgressHandler? = nil, completion: ((DataResponse<UIImage>) -> Void)? = nil) -> Void {
        let urlString = url.stringValue()
        if let imageUrl = URL(string: urlString){
            self.image = nil
            self.af_setImage(withURL: imageUrl, progress: progress, imageTransition: .crossDissolve(0.3), runImageTransitionIfCached: false, completion: completion)
        }
        else{
//            completion(nil)
        }
        

    }

}
