import UIKit
import PlaygroundSupport

typealias BusinessCardParams = (photo: UIImage, name: String, title: String, phone: String, email: String)

let businessCardParams = BusinessCardParams(
    photo: #imageLiteral(resourceName: "home-bg.jpg"),
    name: "Nome Sobrenome",
    title: "Desenvolvedor de Software",
    phone: "(11) 1111-1111",
    email: "nome@sobrenome.com.br")

final class BusinessCardComponents {

    static let defaultFont = UIFont.systemFont(ofSize: 14)
    static let black = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)

    let photoImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    let nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: defaultFont.pointSize)
        label.textColor = black
        return label
    }()

    let titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = defaultFont
        label.textColor = black
        return label
    }()

    let phoneLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = defaultFont
        label.textColor = black
        return label
    }()

    let emailLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = defaultFont
        label.textColor = black
        return label
    }()

    init(businessCardParams: BusinessCardParams) {
        photoImageView.image = businessCardParams.photo
        nameLabel.text = businessCardParams.name
        titleLabel.text = businessCardParams.title
        phoneLabel.text = businessCardParams.phone
        emailLabel.text = businessCardParams.email
    }
}

final class SeniorBusinessCardView: UIView {

    private let businessCardComponents: BusinessCardComponents
    private let imageHeight: CGFloat = 150
    private let defaultMargin: CGFloat = 5

    init(businessCardComponents: BusinessCardComponents) {
        self.businessCardComponents = businessCardComponents
        super.init(frame: .zero)
        setupViewHierarchy()
        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViewHierarchy() {
        addSubview(businessCardComponents.photoImageView)
        addSubview(businessCardComponents.nameLabel)
        addSubview(businessCardComponents.titleLabel)
        addSubview(businessCardComponents.phoneLabel)
        addSubview(businessCardComponents.emailLabel)
    }

    private func setupConstraints() {
        businessCardComponents.photoImageView
            .topAnchor(equalTo: topAnchor)
            .leadingAnchor(equalTo: leadingAnchor)
            .trailingAnchor(equalTo: trailingAnchor)
            .heightAnchor(equalTo: imageHeight)

        businessCardComponents.nameLabel
            .topAnchor(equalTo: businessCardComponents.photoImageView.bottomAnchor, constant: defaultMargin)
            .leadingAnchor(equalTo: leadingAnchor, constant: defaultMargin)
            .trailingAnchor(equalTo: trailingAnchor, constant: defaultMargin)

        businessCardComponents.titleLabel
            .topAnchor(equalTo: businessCardComponents.nameLabel.bottomAnchor, constant: defaultMargin)
            .leadingAnchor(equalTo: leadingAnchor, constant: defaultMargin)
            .trailingAnchor(equalTo: trailingAnchor, constant: defaultMargin)

        businessCardComponents.phoneLabel
            .topAnchor(equalTo: businessCardComponents.titleLabel.bottomAnchor, constant: defaultMargin)
            .leadingAnchor(equalTo: leadingAnchor, constant: defaultMargin)
            .trailingAnchor(equalTo: trailingAnchor, constant: defaultMargin)

        businessCardComponents.emailLabel
            .topAnchor(equalTo: businessCardComponents.phoneLabel.bottomAnchor, constant: defaultMargin)
            .bottomAnchor(equalTo: bottomAnchor)
            .leadingAnchor(equalTo: leadingAnchor, constant: defaultMargin)
            .trailingAnchor(equalTo: trailingAnchor, constant: defaultMargin)
    }
}

final class FullBusinessCardView: UIView {

    private let businessCardComponents: BusinessCardComponents
    private let imageSize: CGFloat = 70
    private let defaultMargin: CGFloat = 5
    private let rightContentContainer: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    init(businessCardComponents: BusinessCardComponents) {
        self.businessCardComponents = businessCardComponents
        super.init(frame: .zero)
        setupViewHierarchy()
        setupConstraints()
        setupImage()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViewHierarchy() {
        addSubview(businessCardComponents.photoImageView)
        addSubview(rightContentContainer)
        rightContentContainer.addSubview(businessCardComponents.nameLabel)
        rightContentContainer.addSubview(businessCardComponents.titleLabel)
        rightContentContainer.addSubview(businessCardComponents.emailLabel)
        rightContentContainer.addSubview(businessCardComponents.phoneLabel)
    }

    private func setupConstraints() {
        businessCardComponents.photoImageView
            .topAnchor(equalTo: topAnchor)
            .leadingAnchor(equalTo: leadingAnchor, constant: defaultMargin)
            .widthAnchor(equalTo: imageSize)
            .heightAnchor(equalTo: imageSize)

        rightContentContainer
            .topAnchor(equalTo: businessCardComponents.photoImageView.topAnchor)
            .heightAnchor(equalTo: imageSize)
            .leadingAnchor(equalTo: businessCardComponents.photoImageView.trailingAnchor, constant: defaultMargin)
            .trailingAnchor(equalTo: trailingAnchor, constant: defaultMargin)

        businessCardComponents.nameLabel
            .topAnchor(equalTo: rightContentContainer.topAnchor)
            .leadingAnchor(equalTo: rightContentContainer.leadingAnchor)
            .trailingAnchor(equalTo: rightContentContainer.trailingAnchor)

        businessCardComponents.titleLabel
            .topAnchor(equalTo: businessCardComponents.nameLabel.bottomAnchor)
            .leadingAnchor(equalTo: rightContentContainer.leadingAnchor)
            .trailingAnchor(equalTo: rightContentContainer.trailingAnchor)

        businessCardComponents.phoneLabel
            .topAnchor(equalTo: businessCardComponents.titleLabel.bottomAnchor)
            .leadingAnchor(equalTo: rightContentContainer.leadingAnchor)
            .trailingAnchor(equalTo: rightContentContainer.trailingAnchor)

        businessCardComponents.emailLabel
            .topAnchor(equalTo: businessCardComponents.phoneLabel.bottomAnchor)
            .leadingAnchor(equalTo: rightContentContainer.leadingAnchor)
            .trailingAnchor(equalTo: rightContentContainer.trailingAnchor)
    }

    private func setupImage() {
        businessCardComponents.photoImageView.layer.masksToBounds = true
        businessCardComponents.photoImageView.layer.cornerRadius = 4
    }
}

final class JuniorBusinessCardView: UIView {

    private let businessCardComponents: BusinessCardComponents
    private let imageSize: CGFloat = 50
    private let defaultMargin: CGFloat = 5
    private let defaultFontSise: CGFloat = 10

    private let stackContentContainer: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    init(businessCardComponents: BusinessCardComponents) {
        self.businessCardComponents = businessCardComponents
        super.init(frame: .zero)
        setupViewHierarchy()
        setupConstraints()
        setupTextFonts()
        setupImage()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViewHierarchy() {
        addSubview(businessCardComponents.photoImageView)
        addSubview(stackContentContainer)
        stackContentContainer.addArrangedSubview(businessCardComponents.nameLabel)
        stackContentContainer.addArrangedSubview(businessCardComponents.titleLabel)
        stackContentContainer.addArrangedSubview(businessCardComponents.emailLabel)
        stackContentContainer.addArrangedSubview(businessCardComponents.phoneLabel)
    }

    private func setupConstraints() {
        businessCardComponents.photoImageView
            .topAnchor(equalTo: topAnchor)
            .leadingAnchor(equalTo: leadingAnchor, constant: defaultMargin)
            .widthAnchor(equalTo: imageSize)
            .heightAnchor(equalTo: imageSize)

        stackContentContainer
            .topAnchor(equalTo: businessCardComponents.photoImageView.topAnchor)
            .leadingAnchor(equalTo: businessCardComponents.photoImageView.trailingAnchor, constant: defaultMargin)
            .trailingAnchor(equalTo: trailingAnchor, constant: defaultMargin)
            .bottomAnchor(equalTo: businessCardComponents.photoImageView.bottomAnchor)
    }

    private func setupTextFonts() {
        [businessCardComponents.nameLabel,
         businessCardComponents.titleLabel,
         businessCardComponents.emailLabel,
         businessCardComponents.phoneLabel].forEach { $0.font = .systemFont(ofSize: defaultFontSise) }
    }

    private func setupImage() {
        businessCardComponents.photoImageView.layer.masksToBounds = true
        businessCardComponents.photoImageView.layer.cornerRadius = 4
    }
}

extension UIView {

    @discardableResult func topAnchor(equalTo anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0) -> Self {
        topAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }

    @discardableResult func bottomAnchor(equalTo anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0) -> Self {
        bottomAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }

    @discardableResult func leadingAnchor(equalTo anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0) -> Self {
        leadingAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }

    @discardableResult func trailingAnchor(equalTo anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0) -> Self {
        trailingAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }

    @discardableResult func heightAnchor(equalTo height: CGFloat) -> Self {
        heightAnchor.constraint(equalToConstant: height).isActive = true
        return self
    }

    @discardableResult func widthAnchor(equalTo height: CGFloat) -> Self {
        widthAnchor.constraint(equalToConstant: height).isActive = true
        return self
    }

}


// - MARK: Playground code

let superview = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 600))
superview.backgroundColor = .white
PlaygroundPage.current.liveView = superview

// - MARK: Create views

let stackCards = UIStackView()
stackCards.axis = .vertical
stackCards.spacing = 13
stackCards.distribution = .fill
stackCards.alignment = .fill
stackCards.translatesAutoresizingMaskIntoConstraints = false
superview.addSubview(stackCards)
stackCards
    .topAnchor(equalTo: superview.topAnchor)
    .leadingAnchor(equalTo: superview.leadingAnchor)
    .trailingAnchor(equalTo: superview.trailingAnchor)

var divider: UIView {
    let divider = UIView(frame: .zero)
    divider.translatesAutoresizingMaskIntoConstraints = false
    divider.heightAnchor(equalTo: 0.5)
    divider.backgroundColor = .lightGray
    return divider
}

var businessCardComponent: BusinessCardComponents {
    return BusinessCardComponents(businessCardParams: businessCardParams)
}

let seniorBusinessCardView = SeniorBusinessCardView(businessCardComponents: businessCardComponent)
seniorBusinessCardView.translatesAutoresizingMaskIntoConstraints = false
seniorBusinessCardView.heightAnchor(equalTo: 235)
stackCards.addArrangedSubview(seniorBusinessCardView)

stackCards.addArrangedSubview(divider)

let fullBusinessCardView = FullBusinessCardView(businessCardComponents: businessCardComponent)
fullBusinessCardView.translatesAutoresizingMaskIntoConstraints = false
fullBusinessCardView.heightAnchor(equalTo: 70)
stackCards.addArrangedSubview(fullBusinessCardView)

stackCards.addArrangedSubview(divider)

let juniorBusinessCardView = JuniorBusinessCardView(businessCardComponents: businessCardComponent)
stackCards.addArrangedSubview(juniorBusinessCardView)
juniorBusinessCardView.translatesAutoresizingMaskIntoConstraints = false
juniorBusinessCardView.heightAnchor(equalTo: 50)

stackCards.addArrangedSubview(divider)

