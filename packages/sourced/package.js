Package.describe({
    name: 'withinboredom:sourced',
    version: '0.0.1',
    // Brief, one-line summary of the package.
    summary: '',
    // URL to the Git repository containing the source code for this package.
    git: '',
    // By default, Meteor will default to using README.md for documentation.
    // To avoid submitting documentation, set this field to null.
    documentation: 'README.md'
});

Npm.depends({
    'boco-sourced': '0.0.5'
});

Package.onUse(function(api) {
    api.versionsFrom('METEOR@1.0.3.2');
    api.use('coffeescript');
    api.addFiles('sourced.coffee');
    api.addFiles('Sourced-Meteor.coffee');
});

Package.onTest(function(api) {
    //api.use('tinytest');

    //api.addFiles('sourced-tests.js');
});
