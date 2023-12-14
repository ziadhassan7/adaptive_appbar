This is a model appbar package created to easily make an adaptive AppBar for both mobile and web development.

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
    backgroundColor: Colors.blue,
    // Custom foreground color
    foregroundColor: Colors.white,
    // Custom widget at the end of the AppBar
    widget: const Icon(Icons.access_alarm),
);
```


## 🧱 Parameters

| Name | Description | Data type | Default value | 
|:------------|-----------------------------------------|----------|-----------|
| title | Dialog's title | String | - | 
| backButtonTitle | Widget showing the dialog's content | String | "Cancel" | 
| onBackPressed | Function that let you build the group separator widget | Function() | - | 
| backgroundColor | Function to handle main button click | Color | colorScheme.primaryContainer | 
| foregroundColor | Perform an action on closing the dialog | Color | colorScheme.onSecondaryContainer -OR- Colors.black| 
| widget | Cancel button title | Widget | - |
