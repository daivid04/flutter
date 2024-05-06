class OffersPost {
  final String start;
  final String end;
  final int discount;
  String? event;

  OffersPost({
    required this.start, 
    required this.end, 
    required this.discount, 
    this.event});
}
