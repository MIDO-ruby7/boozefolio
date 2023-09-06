const CACHE_NAME = 'BOOZEKUZU_cache';
const urlsToCache = [
  '/',
  '/items',
  '/items/searches',
  '/user_items',
  '/items/new',
  '/rooms/show'
];

self.addEventListener('install', (event) => {
  event.waitUntil(
    caches.open(CACHE_NAME)
      .then((cache) => cache.addAll(urlsToCache))
  );
});

self.addEventListener('fetch', (event) => {
  event.respondWith(
    caches.match(event.request)
      .then((response) => response || fetch(event.request))
  );
});