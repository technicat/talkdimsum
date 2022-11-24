These are the JSON files and images (minus icons and logos) for [Talk Dim Sum](http://talkdimsum.com), both the Swift version is on the [App Store](https://apps.apple.com/us/app/talk-dim-sum/id953929066) and the [Flutter version](https://github.com/technicat/dartdimsum) (copy.scm is a Gauche script that copies these files to my local copies of those repos). The Flutter code is not regularly updated, so it may not run this data.

This repo also servers as the Issues database for the app and download site for Flutter builds (which I don't update often, so feel free to file an Issue for a new build).

## Words

As this database is focused on Cantonese dim sum (at least originally), the words are keyed by the Cantonese text fields. Mandarin is only specified if it differs from the Cantonese, and Simplified is the simplified characters version of the Mandarin (implicit or explicit), but again only specified if they are different.

In-progress: moving the *resource* wiktionary link lists from full URLs to a more concise *wkty* list of just the characters or character groups -- let the apps create the URLs by appending the characters to the common wiktionary URL path. If the Cantonese/Mandarin/Simplified is just a string and not a text/wkty pair, then it is assumed there should only be links generated for the individual characters.

## Images

The images are landscape but not consistent in aspect. They are scaled down to a maximum 512 pixels width for historical reasons (old devices running with memory leaky Xamarin).

## Restaurants

All the restaurant links and data are found manually on the Internet (if you just scrape or pull everything tagged "dim sum" you'll get random Asian restaurants and PF Chang's).

For the restaurant links, the restaurant's own website is listed first if available, but no Facebook (because, Facebook), and other links are listed aphabetically by site name. I try to avoid any foor ordering sites pretending to be the main restaurant site. Yelp is here because it's ubiquitous (at least in the US, not so much in Europe, and OpenRice is better in Asia) and typically has enough photos so I can tell if it's real dim sum, Travelocity is omitted because it hangs my link checker.

## URLs

Links are urlencoded, both in the resource lists and the markdown text.

## Formatting

I edit and format these files in Visual Studio Code, and run JSON and [link checks](https://datatracker.ietf.org/doc/html/rfc1738) with some [scripts](http://github.com/technicat/schematic) written in [Gauche](https://practical-scheme.net/gauche/).

This is not a hard and fast rule, but I try to make the categories (categories.json) and new dishes (everything tagged with the first entry in categories.json) multiples of three, as the apps have three-column thumbnail views and it looks better to have an even bottom.

## License

Everything is MIT-licensed except for the regional map images from Wikipedia, licensed from Wikimedia under [TUBS, CC BY-SA 3.0](https://creativecommons.org/licenses/by-sa/3.0).

- Beijing, via [Wikimedia Commons](https://commons.wikimedia.org/wiki/File:Beijing_in_China_(%2Ball_claims_hatched).svg)
- Chaozhou, via [Wikimedia Commons](https://commons.wikimedia.org/wiki/File:Chaozhou_in_China_(%2Ball_claims_hatched).svg)
- Guangdong, via [Wikimedia Commons](https://commons.wikimedia.org/wiki/File:Guangdong_in_China_(%2Ball_claims_hatched).svg)
- Hong Kong, via [Wikimedia Commons](https://commons.wikimedia.org/wiki/File:Hong_Kong_in_China_(%2Ball_claims_hatched).svg)
- Hainan, via [Wikimedia Commons](https://commons.wikimedia.org/wiki/File:Hainan_in_China_(%2Ball_claims_hatched).svg)
- Hunan, via [Wikimedia Commons](https://commons.wikimedia.org/wiki/File:Hunan_in_China_(%2Ball_claims_hatched).svg)
- Shaanxi, via [Wikimedia Commons](https://commons.wikimedia.org/wiki/File:Shaanxi_in_China_(%2Ball_claims_hatched).svg)
- Shandong, via [Wikimedia Commons](https://commons.wikimedia.org/wiki/File:Shandong_in_China_(%2Ball_claims_hatched).svg)
- Shanghai, via [Wikimedia Commons](https://commons.wikimedia.org/wiki/File:Shanghai_in_China_(%2Ball_claims_hatched).svg)
- Shanxi, via [Wikimedia Commons](https://commons.wikimedia.org/wiki/File:Shanxi_in_China_(%2Ball_claims_hatched).svg)
- Sichuan, via [Wikimedia Commons](https://commons.wikimedia.org/wiki/File:Sichuan_in_China_(%2Ball_claims_hatched).svg)
- Taiwan, via [Wikimedia Commons](https://commons.wikimedia.org/wiki/File:Locator_map_of_the_ROC_Taiwan.svg)
- Yunnan, via [Wikimedia Commons](https://commons.wikimedia.org/wiki/File:Yunnan_in_China_(%2Ball_claims_hatched).svg)
- Zhejiang, via [Wikimedia Commons](https://commons.wikimedia.org/wiki/File:Zhejiang_in_China_(%2Ball_claims_hatched).svg)
