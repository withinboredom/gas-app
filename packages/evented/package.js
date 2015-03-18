Package.describe({
    name: 'eventing',
    version: '0.0.1',
    // Brief, one-line summary of the package.
    summary: '',
    // URL to the Git repository containing the source code for this package.
    git: '',
    // By default, Meteor will default to using README.md for documentation.
    // To avoid submitting documentation, set this field to null.
    documentation: 'README.md'
});

Package.onUse(function(api) {
    api.use('coffeescript');
    api.versionsFrom('1.0.3.2');
    api.addFiles('source/BaseObject.coffee');
    api.addFiles('source/Aggregate.coffee');
    api.addFiles('source/Stores/MemoryStore.coffee');
});

Package.onTest(function(api) {
    api.use('practicalmeteor:munit@2.0.2');
    api.use('coffeescript');
    api.use('eventing');
    api.addFiles('tests/aggregateTest.coffee');
    api.addFiles('tests/storeTest.coffee');
});
