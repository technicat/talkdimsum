These are the JSON files and images (minus icons and logos) for [Talk Dim Sum](http://talkdimsum.com), both the Swift version on the [App Store](https://apps.apple.com/us/app/talk-dim-sum/id953929066) and the [Flutter version](https://github.com/technicat/dartdimsum) (copy.scm is a Gauche script that copies these files to my local copies of those repos). The Flutter code is not currently maintained, so it would need to be updated to load the latest data.

This repo also serves as the Issues database for the app and download site for the most recent Flutter builds.

## Items

Items are dishes in Talk Dim Sum but potentially usable for other types of...items.

Items have a photo, a word that identifies it (keyed by the Cantonese), a markdown description, a list of tags, and a list of web links to other info resources.

The markdown has special notation for wiktionary links so that a reader will replace characters surrounced by {} with a link to the wiktionary page.

## Words

Every Word has English and Cantonese names, and Mandarin (traditional characters) and Simplified (simplified characters of the Mandarin name) if they are different.

Yale romanization specifies the Cantonese pronunciation, and Pinyin specifies the Mandarin. Started add Jyutping, eventually should be able to derive the Yale from that.

As this database is focused on Cantonese dim sum (at least originally), the words are keyed by the Cantonese text. Mandarin is only specified if it differs from the Cantonese, and Simplified is the simplified characters version of the Mandarin (implicit or explicit), but again only specified if they are different.

The Chinese/Mandarin/Simplified fields are either strings or text/wkty pairs. If the Cantonese/Mandarin/Simplified is just a string and not a text/wkty pair, then it is assumed there should only be wiktionary links generated for the individual characters.

## Images

The images are landscape but not consistent in aspect. They are scaled down to a maximum 512 pixels width for historical reasons (old devices running with memory leaky Xamarin). They are all JPEG files suffixed .jpg (the Flutter code assumes this, the Swift code doesn't care).

## Restaurants

All the restaurant links and data are found manually on the Internet, and I add them if it looks like they're still operating and serve Cantonese-style dim sum, at the very least ha gow and siu mai (if you just scrape or pull everything tagged "dim sum" you'll get random Asian restaurants and PF Chang's, which does list dim sum on their menu but it's just spring rolls and potstickers).

I started out listing restaurants just in my city, then other states, then all over the world (excluding some for reasons such as [genocidal practices](https://www.genocidewatch.com/countries-at-risk) and [outlawing homosexuality](https://www.bbc.com/news/world-43822234)), but that's just not feasible )especially in Asia), and I got tired of low ratings and reviews complaining I didn't include their city (especially in Europe), so it's back to just the US now.

For the restaurant links, the restaurant's own website is listed first if available, but no Facebook (because, Facebook), and other links are listed aphabetically by site name. I try to avoid any food ordering sites pretending to be the main restaurant site. Yelp is here because it's ubiquitous (at least in the US, not so much in Europe, and OpenRice is better in Asia) and typically has enough photos so I can tell if it's real dim sum, Travelocity is omitted because it hangs my link checker.

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
