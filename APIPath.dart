class APIPath{
  //static String user(String uid) => 'users/$uid';
  static String addToFavorite(String uid ) => 'users/$uid';
  static String pro(String productId) =>'product/$productId';
  static String pros() => 'product';

}