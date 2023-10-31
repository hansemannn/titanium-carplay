# Titanium CarPlay

Use the Apple CarPlay framework in the Titanium SDK.

## Requirements

- [x] Titanium SDK 11.0.0+
- [x] iOS 13+
- [x] Xcode 14+

## Features

- [x] Receive events from your CarPlay instance
- [ ] Present CarPlay-specific user-interfaces
  - [x] Use Map templates to start a trip from CarPlay
  - [ ] Use List- and Grid-templates for selections
  - [ ] Use Alerts and Dialogs

## Example

```js
import CarPlay from 'ti.carplay';

CarPlay.addEventListener('didConnect', ({ interfaceController }) => {
  // The CarPlay screen has connected and is ready to present content.
  const mapTemplate = CarPlay.createMapTemplate();
  interfaceController.setRootTemplate(mapTemplate);
  
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
