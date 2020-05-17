# Arara 🦜

## Browser Sync

```bash
browser-sync start --proxy localhost:3000 --files "app/views, app/concepts"
```

## Customizing Dynamically

```css
:root {
  --base-color: #c6538c;
}

body {
  background-color: var(--base-color);
}
```

```js
var root = document.documentElement;
root.style.setProperty('--base-color', "palevioletred")
```

## Developing

All arara related files are inside `app/javascript/arara`, the folder contains:

- controllers : with all the stimulus controllers
- scss : the basic scss setup

### Demo

TL;DR (quick setup)

```bash
yarn
cd test/dummy
yarn
bundle install
rails server
```

On project root run the `yarn` (or `npm`) command to install the dependencies for arara

To run the demo, go inside `test/dummy` and run the commands:

- bundle install
- yarn/npm (now is needed to install the demo dependencies)

and run the commands on two different terminals:

- ./bin/webpack-dev-server
- rails s

Access http://localhost:3000 to see it running

## NPM Package

This is my first NPM package, the built system was inspired on [ActionCable](https://github.com/rails/rails/blob/ec69083cf3352c78f840de50fdf20ef30334e0b1/actioncable/package.json#L49) and [Material-UI](https://github.com/mui-org/material-ui/blob/49fb53dd3497e3c825bab92f1f1dde42644dbab4/package.json#L33), if there's a bug (and probably there ARE) or you have any suggestion, please open an issue

## Special Thanks ✨

Eu gostaria de agradecer aos colegas @nicolasiensen @lpirola @lucastx @igr-santos @vivianedias que gentilmente cederam o nome da gem no rubygems.

I'd like to say thank you to @nicolasiensen @lpirola @lucastx @igr-santos @vivianedias that gently let me use the gem name on rubygems

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
