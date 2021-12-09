import UIKit
import BaseModules

class CustomImageViewComponentContainer: GenericBaseView<CustomImageViewComponentData> {
    
    private lazy var customImageView: CustomImageViewComponent = {
        let temp = CustomImageViewComponent()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.clipsToBounds = true
        temp.layer.cornerRadius = 8
        temp.contentMode = .scaleAspectFill
        return temp
    }()
    
    override func addMajorFields() {
        super.addMajorFields()
        addCustomImageView()
    }
    
    private func addCustomImageView() {
        addSubview(customImageView)
        
        NSLayoutConstraint.activate([
            
            customImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            customImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            customImageView.topAnchor.constraint(equalTo: topAnchor),
            customImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func loadDataToView() {
        super.loadDataToView()
        guard let data = returnData() else { return }
        customImageView.setData(componentData: data)
        customImageView.contentMode = data.contentMode
    }
}
