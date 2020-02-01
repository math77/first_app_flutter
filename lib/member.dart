class Member {
  final String login;
  final String avatarUrl;

  Member(this.login, this.avatarUrl){
    if (login == null){
      throw ArgumentError("Login of member cannot be null.");
    }

    if (avatarUrl == null){
      throw ArgumentError("Avatar of member cannot be null.");
    }

  }
}
