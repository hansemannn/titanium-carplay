# Titanium CarPlay

Use the iOS 12+ CarPlay framework in Appcelerator Titanium.

## Requirements

- [x] Titanium SDK 7.3.0+
- [x] iOS 12+
- [x] Xcode 10+

## Features

- [x] Receive events from your CarPlay instance
- [ ] Present CarPlay-specific user-interfaces
  - [x] Use Map templates to start a trip from CarPlay
  - [ ] Use List- and Grid-templates for selections
  - [ ] Use Alerts and Dialogs

## Example

```js
import CarPlay from 'ti.carplay';

CarPlay.addEventListener('didConnect', (event) => {
  // The CarPlay screen has connected and is ready to present content.
  const controller = event.interfaceController;
  const mapTemplate = CarPlay.createMapTemplate();
  controller.setRootTemplate(mapTemplate);
  
  // Start a new navigation session!
  mapTemplate.startNavigationSession({
    origin: { latitude: 0.0, longitude: 0.0 },
    destination: { latitude: 0.0, longitude: 0.0 },
    routeChoices: [{
      summaryVariants: ['Via I-280 S'],
      additionalInformationVariants: ['Fastest Route', 'Avoids Tolls'],
      selectionSummaryVariants: ['Turn left']
    }]
  });
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
