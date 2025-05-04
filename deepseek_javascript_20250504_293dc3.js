exports.verifyPurchase = functions.https.onCall(async (data, context) => {
  if (!context.auth) throw new functions.https.HttpsError('unauthenticated', 'Accès refusé');

  const { planId, userId } = data;
  const premiumDurations = { '3mois': 90, '6mois': 180, '12mois': 365 };

  await admin.firestore().collection('users').doc(userId).update({
    isPremium: true,
    premiumUntil: admin.firestore.Timestamp.fromDate(
      new Date(Date.now() + premiumDurations[planId] * 86400 * 1000)
    )
  });
  return { success: true };
});