<!DOCTYPE html>
<html lang="en">
<body>

<h1>EaseMyDeal Task</h1>
<p>
  A Flutter application designed as a part of the EaseMyDeal task, showcasing dynamic UI rendering, 
  state management with BLoC, and a customizable widget layout driven by JSON configurations.
</p>

<h2>Features</h2>
<ul>
  <li><strong>Dynamic UI</strong>: Widgets like banners, categories, offers, and deals are rendered dynamically based on JSON configuration.</li>
  <li><strong>State Management</strong>: Powered by <code>flutter_bloc</code> to handle UI states and events.</li>
  <li><strong>Reusable Components</strong>: Modular and reusable widgets for various sections.</li>
  <li><strong>Navigation</strong>: Seamless navigation between screens like Wishlist, Cart, and Search.</li>
  <li><strong>Customizable UI</strong>: Easily update the app icon, name, and JSON structure to suit your needs.</li>
</ul>

<h2>Screens</h2>
<ol>
  <li><strong>Home Screen</strong>: Displays dynamic sections like delivery info, banners, categories, offers, and daily deals.</li>
  <li><strong>Search Screen</strong>: Includes a modern search bar and dynamic search suggestions.</li>
  <li><strong>Wishlist Screen</strong>: Lists saved items with an option to remove them.</li>
  <li><strong>Cart Screen</strong>: Displays cart items, total price, and checkout options.</li>
</ol>

<h2>Installation</h2>
<h3>Prerequisites</h3>
<p>Ensure Flutter is installed. Follow the <a href="https://docs.flutter.dev/get-started/install" target="_blank">Flutter installation guide</a>.</p>

<h3>Clone the Repository</h3>
<pre>
git clone git@github.com:&lt;your-username&gt;/&lt;repository-name&gt;.git
cd ease_my_deal_task
</pre>

<h3>Install Dependencies</h3>
<pre>
flutter pub get
</pre>

<h3>Run the App</h3>
<pre>
flutter run
</pre>

<h2>File Structure</h2>
<pre>
lib/
├── blocs/                           # State management with BLoC
│   ├── ui_config_bloc.dart          # BLoC for handling dynamic UI state
├── screens/                         # Screens of the app
│   ├── dynamic_screen.dart          # Main screen with dynamic sections
│   ├── search_screen.dart           # Search screen with suggestions
│   ├── wishlist_screen.dart         # Wishlist screen
│   ├── cart_screen.dart             # Cart screen with items and total
├── widgets/                         # Reusable components
│   ├── top_navigation.dart          # Top navigation bar
│   ├── dynamic_banner.dart          # Dynamic banner widget
│   ├── category_section.dart        # Categories section
│   ├── offer_section.dart           # Offers section
│   ├── deals_section.dart           # Deals section
├── main.dart                        # Entry point of the application
assets/                              # Static assets
├── ui_config.json                   # JSON configuration for dynamic UI
├── app_icon.png                     # App icon
</pre>

<h2>Dynamic Configuration</h2>
<p>The UI is driven by the <code>ui_config.json</code> file. Example:</p>
<pre>
{
  "sections": [
    {
      "type": "banner",
      "banners": [
        {
          "title": "Furniture Utsav",
          "subtitle": "Flat 15% OFF",
          "image": "assets/banner.png"
        }
      ]
    },
    {
      "type": "categories",
      "categories": [
        { "icon": "assets/living_room.png", "label": "Living Room" }
      ]
    },
    {
      "type": "offers",
      "offers": [
        {
          "title": "Extra ₹100 off on SBI",
          "subtitle": "No code required"
        }
      ]
    },
    {
      "type": "deals",
      "title": "Deals of the Day",
      "products": [
        {
          "name": "3-Seater Sofa",
          "price": 10499,
          "discount": 72,
          "image": "assets/sofa1.png"
        }
      ]
    }
  ]
}
</pre>

<h2>Customization</h2>
<h3>Change App Icon</h3>
<ol>
  <li>Replace the app icon PNG file in the <code>assets</code> folder.</li>
  <li>Run:
    <pre>
flutter pub run flutter_launcher_icons:main
    </pre>
  </li>
</ol>

<h3>Change App Name</h3>
<ol>
  <li>Update the <code>android:label</code> in <code>AndroidManifest.xml</code> for Android.</li>
  <li>Update <code>CFBundleName</code> in <code>Info.plist</code> for iOS.</li>
</ol>

<h2>Dependencies</h2>
<ul>
  <li><code>flutter_bloc</code>: State management for the app.</li>
  <li><code>provider</code>: Dependency injection for BLoC instances.</li>
  <li><code>flutter_launcher_icons</code>: To set app icons.</li>
  <li><code>cupertino_icons</code>: iOS-style icons for Flutter.</li>
</ul>

<h2>Contributing</h2>
<ol>
  <li>Fork the repository.</li>
  <li>Create a new branch:
    <pre>
git checkout -b feature-name
    </pre>
  </li>
  <li>Commit and push your changes:
    <pre>
git add .
git commit -m "Add your message here"
git push origin feature-name
    </pre>
  </li>
  <li>Open a pull request.</li>
</ol>

<h2>License</h2>
<p>This project is licensed under the MIT License. See the <code>LICENSE</code> file for details.</p>

<h2>Contact</h2>
<p>For queries or support, feel free to reach out:</p>
<ul>
  <li><strong>Email:</strong> iamkumarvishall@gmail.com</li>
  <li><strong>GitHub:</strong> <a href="https://github.com/kumar6174" target="_blank">Your GitHub Profile</a></li>
</ul>

</body>
</html>
