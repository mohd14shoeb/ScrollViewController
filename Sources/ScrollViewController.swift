import UIKit
import KeyboardFrameChangeListener
import ScrollViewKeyboardAvoider

class ScrollViewController: UIViewController {

    init(keyboardFrameChangeListener: KeyboardFrameChangeListening
            = KeyboardFrameChangeListener(notificationCenter: NotificationCenter.default),
         scrollViewKeyboardAvoider: ScrollViewKeyboardAvoiding
            = ScrollViewKeyboardAvoider(animator: { UIView.animate(withDuration: $0, animations: $1) })
        ) {
        self.keyboardFrameChangeListener = keyboardFrameChangeListener
        self.scrollViewKeyboardAvoider = scrollViewKeyboardAvoider
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    // MARK: View

    override func viewDidLoad() {
        super.viewDidLoad()
        keyboardFrameChangeListener.keyboardFrameWillChange = { [unowned self] change in
            self.scrollViewKeyboardAvoider.handleKeyboardFrameChange(change.frame,
                                                                     animationDuration: change.animationDuration,
                                                                     for: UIScrollView()) // TODO:
        }
    }

    // MARK: Private

    private let keyboardFrameChangeListener: KeyboardFrameChangeListening
    private let scrollViewKeyboardAvoider: ScrollViewKeyboardAvoiding

}
