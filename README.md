# Digital Nepal V1 MVP

A Flutter starter for the Digital Nepal super-app concept.

## Included UI
- Professional Digital Nepal branding
- Home/social feed
- Chat list and conversation UI
- Audio call and video call screens
- Short-video feed UI
- Marketplace UI
- Profile/settings entry points

## Important
The audio/video call screens are **UI only in this starter**. Real calls require:
1. Firebase project setup (Auth/Firestore as needed)
2. WebRTC signaling and a TURN server
3. Call state/permissions/notification handling
4. Production security rules and privacy policy

Wallet/payment should be implemented in a later phase through properly licensed Nepal payment/banking partners rather than storing money in an unlicensed in-app wallet.

## Run
1. Install Flutter SDK.
2. Run `flutter pub get`.
3. Add your Firebase Android/iOS configuration.
4. Run `flutter run`.

## Suggested build order
V1.1: real authentication + user profiles
V1.2: real-time chat + media upload
V1.3: real audio/video calls (WebRTC + signaling + TURN)
V1.4: short-video upload/feed
V1.5: marketplace
V2: licensed payment integrations, business accounts, groups and mini-app ecosystem
