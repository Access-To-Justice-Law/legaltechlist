#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Legal Tech List"
    xml.author "Legal Tech List"
    xml.description "Explore a curated list of 400+ companies changing the way legal is done"
    xml.link "https://localhost:3000"
    xml.language "en"

    for company in @companies
      xml.item do
        if company.name
          xml.title company.name
        else
          xml.title ""
        end
        xml.author "Legal Tech List"
        xml.pubDate company.created_at.to_s(:rfc822)
        xml.link "https://localhost:3000/feed/" + company.id.to_s + "-" + company.name
        xml.guid company.id

        text = company.description
		# if you like, do something with your content text here e.g. insert image tags.
		# Optional. I'm doing this on my website.
        if company.image.exists?
            image_url = company.image.url(:large)
            image_caption = company.image_caption
            image_align = ""
            image_tag = "
                <p><img src='" + image_url +  "' alt='" + image_caption + "' title='" + image_caption + "' align='" + image_align  + "' /></p>s
              "
            text = text.sub('{image}', image_tag)
        end
        xml.description "<p>" + text + "</p>"

      end
    end
  end
end