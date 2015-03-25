Package.describe({
  name: 'withinboredom:testing',
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
  api.versionsFrom('WINDOWS-PREVIEW@0.3.0');
    api.use([
        'coffeescript',
        'kraf:immutable',
        'practicalmeteor:munit@2.0.2',
    ]);

    api.addFiles([
        'source/classes/depend_on.coffee',
        'source/classes/extend.coffee',
        'source/modules/to_map.coffee',
        'source/modules/to_create.coffee',
        'source/sinon/to_match.coffee',
    ]);
});

Package.onTest(function(api) {
  api.use([
      'coffeescript',
      'kraf:immutable',
      'withinboredom:testing',
      'practicalmeteor:munit@2.0.2',
  ]);
  api.addFiles([
      'tests/classes/depend_on.integration.coffee',
      'tests/classes/extend.spec.coffee',
      'tests/modules/to_map.integration.coffee',
      'tests/modules/to_create.integration.coffee',
      'tests/sinon/to_match.integration.coffee',
  ]);
});
