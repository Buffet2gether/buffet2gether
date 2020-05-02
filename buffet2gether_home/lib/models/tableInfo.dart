class TableInfo{

  final bool sport;
  final bool pet;
  final bool technology;
  final bool political;
  final bool fashion;
  final bool entertainment;
  final bool book;
  final int ageStart;
  final int ageEnd;
  final String gender;

  TableInfo({this.fashion, this.sport, this.technology, this.political, this.entertainment, this.book, this.pet,this.ageStart,this.ageEnd,this.gender});

  String interesting(){
    List<bool> interest= [fashion,sport,technology,political,entertainment,book,pet];
    String infomation = '';
    if(interest[0]){
      infomation += '#fashion';
    }
    if(interest[1]){
      infomation += '#sport';
    }
    if(interest[2]){
      infomation += '#technology';
    }
    if(interest[3]){
      infomation += '#political';
    }
    if(interest[4]){
      infomation += '#entertainment';
    }
    if(interest[5]){
      infomation += '#book';
    }
    if(interest[6]){
      infomation += '#pet';
    }
    return infomation;
  }

  @override
  bool getFashion() {
    return fashion;
  }

  @override
  bool getEntertainment() {
    return entertainment;
  }


  @override
  bool getPet() {
    print(pet);
    return pet;
  }

  @override
  bool getPolitical() {
    return political;
  }

  @override
  bool getSport() {
    return sport;
  }

  @override
  bool getTechnology() {
    return technology;
  }

  @override
  bool getBook() {
    return book;
  }

  @override
  String getGender() {
    return gender;
  }

  @override
  int getAgeStart() {
    return ageStart;
  }

  @override
  int getAgeEnd() {
    return ageEnd;
  }

}