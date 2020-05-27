const path = require('path');
const glob = require('glob');
const TerserPlugin = require('terser-webpack-plugin');
const OptimizeCSSAssetsPlugin = require('optimize-css-assets-webpack-plugin');
const CopyWebpackPlugin = require('copy-webpack-plugin');
const VueLoaderPlugin = require('vue-loader/lib/plugin');

module.exports = (env, options) => ({
  optimization: {
    minimizer: [
      new TerserPlugin({ cache: true, parallel: true, sourceMap: false }),
      new OptimizeCSSAssetsPlugin({})
    ]
  },
  entry: {
    'app': ['./js/app.js'].concat(glob.sync('./vendor/**/*.js')),
    'auth': ['./js/auth.js'].concat(glob.sync('./vendor/**/*.js')),
    'home': ['./js/home.js'].concat(glob.sync('./vendor/**/*.js'))
  },
  output: {
    filename: '[name].js',
    path: path.resolve(__dirname, '../priv/static/js'),
    publicPath: '/js/'
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader'
        }
      },
      {
        test: /\.css$/,
        use: [
          'vue-style-loader',
          'css-loader'
        ]
      },
      {
        test: /\.vue$/,
        loader: 'vue-loader'
      }
    ]
  },
  resolve: {
    alias: {
      'vue$': 'vue/dist/vue.esm.js',
      'bootstrap-vue$': 'bootstrap-vue/src/index.js'
    },
    extensions: ['*', '.js', '.vue', '.json']
  },
  plugins: [
    new CopyWebpackPlugin([{ from: 'static/', to: '../' }]),
    new VueLoaderPlugin()
  ]
});
