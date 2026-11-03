.PHONY: website listings

website: listings
	pandoc --standalone \
         --from commonmark_x+alerts \
         --output=website/index.html \
         --template=pandoc/template.html4 \
         --css=style.css \
         --toc \
         --toc-depth=1 \
         --resource-path=. \
         --lua-filter=pandoc/paper.lua \
         --lua-filter=pandoc/date.lua \
         src/index.md

listings:
	sh gen-listing.sh website/prf-theo "Proof Theory Course Materials"
	sh gen-listing.sh website/prf-sys "Proof Systems Course Materials"
