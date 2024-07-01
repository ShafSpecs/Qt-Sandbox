import sys
from PySide6.QtCore import QObject, Slot, Signal, Property
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine, qmlRegisterType


class Counter(QObject):
    def __init__(self):
        super().__init__()
        self._count = 0

    def get_count(self):
        return self._count

    def set_count(self, value):
        if self._count != value:
            self._count = value
            self.countChanged.emit()

    countChanged = Signal()

    count = Property(type=int, fget=get_count, fset=set_count, notify=countChanged)

    @Slot()
    def increment(self):
        self.set_count(self.get_count() + 1)

    @Slot()
    def decrement(self):
        self.set_count(self.get_count() - 1)


if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    counter = Counter()
    qmlRegisterType(Counter, "CounterModule", 1, 0, "Counter")

    engine.load("main.qml")

    if not engine.rootObjects():
        sys.exit(-1)

    sys.exit(app.exec())
