from PySide6.QtQuick import QQuickItem
from PySide6.QtCore import Property, Signal, Slot


class CustomCounter(QQuickItem):
    def __init__(self, parent=None):
        super().__init__(parent)
        self._count = 0

    countChanged = Signal()

    @Property(int, notify=countChanged)
    def count(self):
        return self._count

    @count.setter
    def count(self, value):
        if self._count != value:
            self._count = value
            self.countChanged.emit()

    @Slot()
    def increment(self):
        self._count += 1
