//
//  UsuarioCell.swift
//  JBecerraEcommerce
//
//  Created by Digis01 Soluciones Digitales on 22/09/22.
//

import UIKit

class UsuarioCell: UITableViewCell {

    
    @IBOutlet weak var Nombre: UILabel!

    @IBOutlet weak var ApellidoPaterno: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
