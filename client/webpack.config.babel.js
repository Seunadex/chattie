// For inspiration on your webpack configuration, see:
// https://github.com/shakacode/react_on_rails/tree/master/spec/dummy/client
// https://github.com/shakacode/react-webpack-rails-tutorial/tree/master/client

import webpack from "webpack";
import { getIfUtils, removeEmpty } from "webpack-config-utils";
import ManifestPlugin from "webpack-manifest-plugin";
import { resolve } from "path";
import webpackConfigLoader from "react-on-rails/webpackConfigLoader";
import RollbarSourceMapPlugin from "rollbar-sourcemap-webpack-plugin";

const configPath = resolve("..", "config");
const { output } = webpackConfigLoader(configPath);

export default env => {
  const { ifProd, ifNotProd } = getIfUtils(env);
  return {
    context: resolve(__dirname),

    entry: {
      "webpack-bundle": [
        "es5-shim/es5-shim",
        "es5-shim/es5-sham",
        "babel-polyfill",
        "./app/registrations/setup",
        "./app/registrations/components",
        "./app/registrations/stores"
      ]
    },

    devtool: ifNotProd("eval-source-map", "source-map"),

    output: {
      // Name comes from the entry section.
      filename: "[name]-[chunkhash].js",
      chunkFilename: "[name]-[chunkhash].chunk.js",

      // Leading slash is necessary
      publicPath: output.publicPath,
      path: output.path
    },

    resolve: {
      extensions: [".js", ".jsx"],
      modules: ["node_modules", "app/assets/javascripts/node_modules"]
    },

    plugins: removeEmpty([
      new webpack.EnvironmentPlugin({
        NODE_ENV: "development", // use 'development' unless process.env.NODE_ENV is defined
        DEBUG: false
      }),
      new ManifestPlugin({
        publicPath: output.publicPath,
        writeToFileEmit: true
      }),
      ifProd(
        new RollbarSourceMapPlugin({
          accessToken: process.env.ROLLBAR_ACCESS_TOKEN,
          version: process.env.SOURCE_VERSION, // HEROKU var set during build process
          publicPath: `https://${process.env
            .HEROKU_APP_NAME}.herokuapp.com${output.publicPath.replace(
            // bandaid for RollbarSourceMapPlugin stuffing a / between public path
            // regardless of if there is a trailing / or not
            /\/+$/,
            ""
          )}`
        })
      )
    ]),

    module: {
      rules: removeEmpty([
        {
          test: require.resolve("react"),
          use: {
            loader: "imports-loader",
            options: {
              shim: "es5-shim/es5-shim",
              sham: "es5-shim/es5-sham"
            }
          }
        },
        {
          test: /\.jsx?$/,
          use: "babel-loader",
          exclude: /node_modules/
        },
        { test: /\.(png|jpg)$/,
          loader: 'url-loader?limit=8192'
        }
      ])
    }
  };
};
