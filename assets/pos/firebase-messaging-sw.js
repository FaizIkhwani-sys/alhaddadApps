importScripts('https://www.gstatic.com/firebasejs/9.6.10/firebase-app-compat.js');
importScripts('https://www.gstatic.com/firebasejs/9.6.10/firebase-messaging-compat.js');

firebase.initializeApp({
    apiKey: "AIzaSyAtyu6quL6A-vk-Qpzoy4E1QUrLJDGLDWE",
    authDomain: "sistem-alhaddad.firebaseapp.com",
    databaseURL: 'https://sistem-alhaddad.firebaseio.com',
    projectId: "sistem-alhaddad",
    storageBucket: "sistem-alhaddad.appspot.com",
    messagingSenderId: "894516371487",
    appId: "1:894516371487:web:29d29dc6d7ae75db28752a",
    measurementId: "G-FMT4QB7CGR"
});

const messaging = firebase.messaging();

messaging.onBackgroundMessage(function(payload) {
    console.log('[firebase-messaging-sw.js] Received background message ', payload);
    // Customize notification here
    const notificationTitle = payload['notification']['title'];
    const notificationOptions = {
        body: payload['notification']['body'],
        icon: 'https://alhaddad-pos.myrichappsproject.tk/assets/imgs/alhaddad.png'
    };

    self.registration.showNotification(notificationTitle, notificationOptions);
});