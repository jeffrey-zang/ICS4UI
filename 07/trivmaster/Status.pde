class StatusController {
  String currentStatus;

  StatusController() {
    this.goPractice();
  }

  String getStatus() {
    return this.currentStatus;
  }

  void goPractice() {
    this.currentStatus = "practice";
  }
  void goStats() {
    this.currentStatus = "stats";
  }
  void goSettings() {
    this.currentStatus = "settings";
  }
}
