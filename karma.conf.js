var webpack = require('webpack');

export default {
   (config) {
  config.set({
    browsers: ['Chrome'],
    singleRun: true,
    frameworks: ['mocha', 'sinon'],
    files: ['webpack/tests.config.js'],
    preprocessors: {
      'webpack/tests.config.js': ['webpack', 'sourcemap']
    },
    reporters: ['dots'],
    webpack: {
      module: {
        loaders: [
          {
            test: /\.jsx?$/,
            exclude: /node_modules/,
            loader: 'babel-loader'
          }]
      },
      watch: true,
      resolve: {
        extensions: [".js", ".jsx", ".js.jsx"]
      },
      devtool: 'inline-source-map',
    },
    webpackServer: {
      noInfo: true
    }
  });
};
