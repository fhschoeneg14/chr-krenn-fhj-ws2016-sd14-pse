package at.fhj.swd14.pse.news;

import at.fhj.swd14.pse.person.PersonConverter;

import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

public final class NewsConverter {

    private NewsConverter() {
    }

    public static NewsDto convert(News news) {
        if (news == null) {
            return null;
        }
        final NewsDto dto = new NewsDto();
        dto.setId(news.getId());
        dto.setAuthor(PersonConverter.convert(news.getAuthor()));
        dto.setMessage(news.getMessage());
        dto.setTitle(news.getTitle());
        dto.setCreated(news.getCreated());
        dto.setModified(news.getModified());
        dto.setActivation(news.getActivation());
        dto.setTermination(news.getTermination());

        return dto;
    }

    public static News convert(NewsDto news) {
        if (news == null) {
            return null;
        }

        final News entity = new News();
        entity.setId(news.getId());
        entity.setMessage(news.getMessage());
        entity.setTitle(news.getTitle());
        entity.setAuthor(PersonConverter.convert(news.getAuthor()));
        entity.setActivation(news.getActivation());
        entity.setTermination(news.getTermination());
        return entity;
    }

    public static List<NewsDto> convertToDtoList(Collection<News> news) {
        if (news == null) {
            return null;
        }
        return news.stream().map(NewsConverter::convert).collect(Collectors.toList());
    }

    public static List<News> convertToDoList(Collection<NewsDto> news) {
        if (news == null) {
            return null;
        }
        return news.stream().map(NewsConverter::convert).collect(Collectors.toList());
    }
}
