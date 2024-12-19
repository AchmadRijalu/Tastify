//
//  GeneralButton.swift
//  Tastify
//
//  Created by Achmad Rijalu on 16/12/24.
//

import UIKit


protocol GeneralButtonDelegate: AnyObject {
    func buttonTapped(_ button: UIButton)
}

@IBDesignable
class GeneralButton: UIView {
    
    @IBOutlet weak var button: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    weak var delegate: GeneralButtonDelegate?
    
    
    func loadFromNib(nibName: String) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    private func setupView() {
        guard let view = self.loadFromNib(nibName: "GeneralButton") else {return}
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc private func buttonTapped() {
        delegate?.buttonTapped(button)
    }
}
