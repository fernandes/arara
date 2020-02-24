import babel from "rollup-plugin-babel"
import uglify from "rollup-plugin-uglify"

const uglifyOptions = {
  mangle: false,
  compress: false,
  output: {
    beautify: true,
    indent_level: 2
  }
}

export default {
  input: "app/javascript/arara/index.js",
  output: {
    file: "app/assets/javascripts/arara.js",
    format: "umd",
    name: "Arara",
    globals: {
      '@material/checkbox': 'checkbox',
      '@material/chips': 'chips',
      '@material/data-table': 'data-table',
      '@material/dialog': 'dialog',
      '@material/form-field': 'form-field',
      '@material/icon-button': 'icon-button',
      '@material/linear-progress': 'linear-progress',
      '@material/list': 'list',
      '@material/menu': 'menu',
      '@material/radio': 'radio',
      '@material/ripple': 'ripple',
      '@material/select': 'select',
      '@material/slider': 'slider',
      '@material/snackbar': 'snackbar',
      '@material/switch': 'switch',
      '@material/tab-bar': 'tab-bar',
      '@material/textfield': 'textfield',
      '@material/top-app-bar': 'top-app-bar',
      'stimulus': 'stimulus',
    },
  },
  plugins: [
    babel(),
    uglify(uglifyOptions),
  ],
  external: [
    '@material/checkbox',
    '@material/chips',
    '@material/data-table',
    '@material/dialog',
    '@material/form-field',
    '@material/icon-button',
    '@material/linear-progress',
    '@material/list',
    '@material/menu',
    '@material/radio',
    '@material/ripple',
    '@material/select',
    '@material/slider',
    '@material/snackbar',
    '@material/switch',
    '@material/tab-bar',
    '@material/textfield',
    '@material/top-app-bar',
    'stimulus',
  ],
}
