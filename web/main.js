
window.addEventListener('load', function (ev) {
    let useHtml = true;

    // Download main.dart.js
    _flutter.loader.loadEntrypoint({
        serviceWorker: {
            serviceWorkerVersion: serviceWorkerVersion,
        },
        onEntrypointLoaded: async function (engineInitializer) {
            // Run-time engine configuration
            let config = {
                renderer: useHtml ? "html" : "canvaskit",
            }

            let appRunner = await engineInitializer.initializeEngine(
                config
            );

            await appRunner.runApp();

            window.setTimeout(() => {
                // remove loading effect after content is ready
                let loading = document.querySelector('.loading');
                loading.remove();
            }, 200);
        }
    });
});
