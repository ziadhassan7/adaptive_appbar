A model for an adaptive AppBar. Created to easily make an app bar that changes size for both mobile and web development.

![adaptive_appbar](https://github.com/ziadhassan7/adaptive_appbar/assets/31738365/a826fec0-c350-4dd7-8598-0a75edb696ae)

## 🎯 Features

* Responsive.
* Easy to implement.
* Fully customizable!

## 📦 Implementation

```dart
AdaptiveAppBar(
    context,
    title: "Awesome AppBar",
    onBackPressed: () {},
);
```

## 🎨 Customization

```dart
AdaptiveAppBar(
    context,
    title: "Awesome AppBar",
    onBackPressed: () {},

    // Title for back button (Shows only on big screens)
    backButtonTitle: "Discard",
    // Custom background color
    backgroundColor: Colors.white,
    // Custom foreground color
    foregroundColor: Colors.blue,
    // Custom elevation
    elevation: 1,
    // Custom widget at the end of the AppBar
    widget: const Icon(Icons.access_alarm),
);
```


## 🧱 Parameters

| Name | Description | Data type | Default value | 
|:------------|-----------------------------------------|----------|-----------|
| title | AppBar's title | String | - | 
| backButtonTitle | Title for back button (Shows only on big screens) | String | "Cancel" | 
| onBackPressed | Handle back button press | Function() | - | 
| backgroundColor | Custom background color | Color | colorScheme.primaryContainer | 
| foregroundColor | Custom foreground color | Color | colorScheme.onSecondaryContainer -OR- Colors.black | 
| elevation | Custom elevation | double | 0 | 
| widget | Custom widget at the end of the AppBar | Widget | - |
