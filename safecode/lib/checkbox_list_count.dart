class CheckboxListCount {
  int count;
  CheckboxListCount(this.count);

  int getCount() {
    return count;
  }

  void changeCount(bool? value) {
    count += (value! ? 1 : -1);
  }
}
