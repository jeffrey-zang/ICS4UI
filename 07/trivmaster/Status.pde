class StatusController {
  String currentStatus;

  StatusController() {
    this.currentStatus = "not started";
  }
  
  void startReading() {
    this.currentStatus = "reading";
  }
  void stopReading() {
    this.currentStatus = "buzzed";
  }
  void visitStats() {
    this.currentStatus = "stats";
  }
  void visitSettings() {
    this.currentStatus = "settings";
  }
  void visitPractice() {
    this.currentStatus = "not started";
  }
}
