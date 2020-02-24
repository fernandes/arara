let defaultPresets;

if (process.env.BABEL_ENV === 'es') {
  defaultPresets = [];
} else {
  defaultPresets = [
    [
      '@babel/preset-env',
      {
        modules: ['esm', 'production-umd', 'test'].includes(process.env.BABEL_ENV) ? false : 'commonjs',
      },
    ],
  ];
}

const productionPlugins = [
  ['@babel/plugin-transform-runtime', { version: '^7.4.4', useESModules: true }]
];

module.exports = {
  presets: defaultPresets,
  plugins: [
    ['@babel/plugin-proposal-class-properties', { loose: true }],
    ['@babel/plugin-proposal-object-rest-spread', { loose: true }],
    // for IE 11 support
    '@babel/plugin-transform-object-assign',
  ],
  ignore: [/@babel[\\|/]runtime/], // Fix a Windows issue.
  env: {
    cjs: {
      plugins: productionPlugins,
    },
    coverage: {
      plugins: [
        'babel-plugin-istanbul',
      ],
    },
    development: {},
    esm: {
      plugins: [...productionPlugins],
    },
    es: {
      plugins: [...productionPlugins],
    },
    production: {
      plugins: [...productionPlugins],
    },
    'production-umd': {
      plugins: [...productionPlugins],
    },
    test: {
      sourceMaps: 'both',
    },
    benchmark: {
      plugins: [...productionPlugins]
    },
  },
};
