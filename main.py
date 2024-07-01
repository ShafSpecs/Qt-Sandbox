import sys
from PySide6.QtQml import QQmlApplicationEngine, qmlRegisterType
from PySide6.QtWidgets import QApplication
from PySide6.QtCore import QObject, Slot, Signal

from custom_components import CustomCounter

class Backend(QObject):
    messageChanged = Signal(str)

    def __init__(self):
        super().__init__()
        self._message = "Hello from Python!"

    @Slot(str)
    def updateMessage(self, new_message):
        self._message = new_message
        self.messageChanged.emit(self._message)

    @Slot(result=str)
    def getMessage(self):
        return self._message

if __name__ == "__main__":
    app = QApplication([])
    engine = QQmlApplicationEngine()

    # Register custom component
    qmlRegisterType(CustomCounter, "CustomComponents", 1, 0, "CustomCounter")

    # Create and expose backend object
    backend = Backend()
    engine.rootContext().setContextProperty("backend", backend)

    engine.load("qml/main.qml")

    if not engine.rootObjects():
        sys.exit(-1)

    sys.exit(app.exec())