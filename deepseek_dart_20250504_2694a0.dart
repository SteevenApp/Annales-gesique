class PaymentService {
  static Future<bool> purchaseSubscription(String planId) async {
    final ProductDetails product = await InAppPurchase.instance.queryProductDetails(planId);
    await InAppPurchase.instance.buyNonConsumable(purchaseParam: PurchaseParam(productDetails: product));
    
    // Vérification côté serveur (Firebase Functions)
    await FirebaseFunctions.instance.verifyPurchase(planId);
    return true;
  }

  static Future<bool> isUserPremium() async {
    DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
    return userDoc['isPremium'] ?? false;
  }
}