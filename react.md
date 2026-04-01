# CSR: Client Side Rendering
Once the JS bundle has been downloaded and parsed, React springs into action,
conjuring all of the DOM nodes for our entire application, and housing it in
that empty `<div id="root">`

# SSR: Server Side Rendering
A server generates the initial HTML so that users don't have to stare at an
empty white page while the JS bundles are downloaded and parsed. Client-side
React then picks up where server-side React left off, adopting the DOM and
*hydrating* (sprinkling in the interactivity)
