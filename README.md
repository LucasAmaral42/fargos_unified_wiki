# Fargo's Unified Wiki API

URL to heroku: https://fargos-unified-wiki-api.herokuapp.com/

Created for me when i'm playing Terraria in Fargo's Mod with Calamity, Shadows of Abaddon, Dragon Ball Terraria and Thorium. You are free to copy the project and upgrade it! Just let me know then I can use it too! ;)
___
## IMPORTANT
Some items does not have a valid image_url or does not have a image_url, in case you want to add the images you can update the item in database or update the script to get it correctly.

**Scripts path**
scripts/(the_mod_you_want_to_update)/step2_get_info_from_links.rb
**Feel free to update it and suggest updates!**
___

### Install the dependencies
`bundle install`
`yarn install`

### Before run
`rake db:setup`
`rake create_items_from_jsonl:start` if you want to use the jsonl stored in public/jsonl

### To run the server
`rails s`
### To run the interactive console
`rails c`

### Endpoints

`[GET] / (root)` -> returns all the items
```
  accepted params: { mod: [], types: [] }
```

`[GET] /types` -> returns all the items types
