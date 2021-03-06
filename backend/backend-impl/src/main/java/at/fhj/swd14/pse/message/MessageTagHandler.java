package at.fhj.swd14.pse.message;

import at.fhj.swd14.pse.tag.Tag;
import at.fhj.swd14.pse.tag.TagConverter;
import at.fhj.swd14.pse.tag.TagDto;
import at.fhj.swd14.pse.tag.TagService;

import javax.ejb.EJB;
import java.util.HashSet;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class MessageTagHandler {

    @EJB
    private TagService tagService;

    public void handleTags(MessageDto dto) {
        if (dto != null) {

            Message message = MessageConverter.convert(dto);

            Set<String> tagSet = new HashSet<>();

            // search for tags in title
            tagSet.addAll(findTags(message.getTitle()));
            // search for tags in context
            tagSet.addAll(findTags(message.getContent()));

            TagDto tagDto;

            for (String tag : tagSet) {

                tagDto = tagService.findByName(tag);

                if (tagDto == null) {
                    Tag t = new Tag();
                    t.setName(tag);
                    tagDto = TagConverter.convert(t);
                    tagService.save(tagDto);
                }

                message.addTag(TagConverter.convert(tagDto));
            }
            dto = MessageConverter.convert(message);

        }

    }

    private Set<String> findTags(String text) {
        Set<String> tagSet = new HashSet<>();

        Pattern p = Pattern.compile("#(\\w+)");

        Matcher matcher = p.matcher(text);

        while (matcher.find()) {
            tagSet.add(matcher.group(0).substring(1).toLowerCase());
        }

        return tagSet;
    }
}
