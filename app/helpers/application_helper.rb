module ApplicationHelper
  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end

  def make_tags_links(text)
    tags = Tag.parse_hash_tags(text)

    tags.map do |t|
      text.gsub!(t, link_to(t, tag_path(t.mb_chars.downcase.to_s.delete('#'))))
    end

    text
  end
end
