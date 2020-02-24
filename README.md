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

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
