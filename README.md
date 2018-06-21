# Titanium CarPlay

Use the iOS 12+ CarPlay framework in Appcelerator Titanium.

## Requirements

- [x] Titanium SDK 7.3.0+
- [x] iOS 12+
- [x] Xcode 10+

## Features

- [x] Receive events from your CarPlay instance
- [ ] Present CarPlay-specific user-interfaces

## Example

```js
import CarPlay from 'ti.carplay';

CarPlay.addEventListener('didConnect', () => {
  // The CarPlay screen has connected and is ready to present content.
});

CarPlay.addEventListener('didDisconnect', () => {
  // The CarPlay screen has disconnected.
});

CarPlay.addEventListener('didSelectNavigationAlert', () => {
  // If your application posts a `NavigationAlert` while backgrounded, 
  // a notification banner may be presented to the user.
});

CarPlay.addEventListener('didSelectManeuver', () => {
  // If your application posts a `Maneuver` while backgrounded, 
  // a notification banner may be presented to the user.
});
```

## Author

Hans Knöchel ([@hansemannnn](https://twitter.com/hansemannnn) / [Web](http://hans-knoechel.de))

## License

MIT

## Contributing

Code contributions are greatly appreciated, please submit a new [Pull-Request](https://github.com/hansemannn/titanium-carplay/pull/new/master)!
