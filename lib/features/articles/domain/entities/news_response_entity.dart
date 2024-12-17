import 'package:equatable/equatable.dart';

class NewsResponseEntity extends Equatable {
  final String status;
  final int numResults;
  final List<NewsArticleEntity> results;

  const NewsResponseEntity({
    required this.status,
    required this.numResults,
    required this.results,
  });

  @override
  List<Object?> get props => [status, numResults, results];
}

class NewsArticleEntity extends Equatable {
  final String uri;
  final String url;
  final int id;
  final String source;
  final String publishedDate;
  final String updated;
  final String section;
  final String? subsection;
  final String nytdsection;
  final String adxKeywords;
  final String? column;
  final String byline;
  final String type;
  final String title;
  final String abstractText;
  final List<String> desFacet;
  final List<String> orgFacet;
  final List<String> perFacet;
  final List<String> geoFacet;
  final List<MediaEntity> media;

  const NewsArticleEntity({
    required this.uri,
    required this.url,
    required this.id,
    required this.source,
    required this.publishedDate,
    required this.updated,
    required this.section,
    required this.subsection,
    required this.nytdsection,
    required this.adxKeywords,
    required this.column,
    required this.byline,
    required this.type,
    required this.title,
    required this.abstractText,
    required this.desFacet,
    required this.orgFacet,
    required this.perFacet,
    required this.geoFacet,
    required this.media,
  });

  @override
  List<Object?> get props => [
        uri,
        url,
        id,
        source,
        publishedDate,
        updated,
        section,
        subsection,
        nytdsection,
        adxKeywords,
        column,
        byline,
        type,
        abstractText,
        desFacet,
        orgFacet,
        perFacet,
        geoFacet,
        media,
      ];
}

class MediaEntity extends Equatable {
  final String type;
  final String subtype;
  final String caption;
  final String copyright;
  final List<MediaMetadataEntity> metadata;

  const MediaEntity({
    required this.type,
    required this.subtype,
    required this.caption,
    required this.copyright,
    required this.metadata,
  });

  @override
  List<Object?> get props => [type,subtype,caption,copyright,metadata];
}
class MediaMetadataEntity extends Equatable{
  final String url;
  final String format;
  final int height;
  final int width;

  const MediaMetadataEntity({
    required this.url,
    required this.format,
    required this.height,
    required this.width,
  });

  @override
  List<Object?> get props => [url,format,height,width];
}