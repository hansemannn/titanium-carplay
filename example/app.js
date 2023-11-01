import TiCarPlay from 'ti.carplay';

// !! Before you start !!
// 
// 1. Make sure to use Titanium SDK 12.3.0+ to support scene handling.
//
// 2. Make sure to include the following keys into your project:
// <!-- CarPlay multi-scene handling -->
// <key>UIApplicationSceneManifest</key>
// <dict>
//     <key>UIApplicationSupportsMultipleScenes</key>
//     <true/>
//     <key>UISceneConfigurations</key>
//     <dict>
//         <key>CPTemplateApplicationSceneSessionRoleApplication</key>
//         <array>
//             <dict>
//                 <key>UISceneClassName</key>
//                 <string>CPTemplateApplicationScene</string>
//                 <key>UISceneConfigurationName</key>
//                 <string>Default Configuration</string>
//                 <key>UISceneDelegateClassName</key>
//                 <string>TiCarplay.TiCarPlaySceneDelegate</string>
//             </dict>
//         </array>
//         <key>UIWindowSceneSessionRoleApplication</key>
//         <array>
//             <dict>
//                 <key>UISceneConfigurationName</key>
//                 <string>Default Configuration</string>
//                 <key>UISceneDelegateClassName</key>
//                 <string>TiApp</string>
//             </dict>
//         </array>
//     </dict>
// </dict>
//
// 3. Make sure to include the following entitlements (or related for your use case)
// <entitlements>
// <dict>
//     <key>com.apple.developer.carplay-quick-ordering</key>
//     <true/>
// </dict>
// </entitlements>

TiCarPlay.addEventListener('didConnect', () => console.warn('CarPlay is connected!'));

const window = Ti.UI.createWindow();

const btn = Ti.UI.createButton({
    title: 'Change layout'
});

const listTemplate = TiCarPlay.createListTemplate({
    title: 'Home',
    sections: [{
        items: [{
            text: 'Cell 1',
            detailText: 'Detail 1',
            handler: () => {
                TiCarPlay.presentTemplate(TiCarPlay.createAlertTemplate({
                    title: 'My Alert',
                    actions: [{ title: 'Dismiss', handler: () => TiCarPlay.dismissTemplate() }]
                }))
            }
        }]
    }]
})

btn.addEventListener('click', () => {
    TiCarPlay.setRootTemplate(listTemplate);
});

window.add(btn);
window.open();
