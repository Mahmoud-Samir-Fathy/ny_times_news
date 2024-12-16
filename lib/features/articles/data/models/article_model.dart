class NewsResponse {
  final String status;
  final int numResults;
  final List<NewsArticle> results;

  NewsResponse({
    required this.status,
    required this.numResults,
    required this.results,
  });

  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    return NewsResponse(
      status: json['status'],
      numResults: json['num_results'],
      results: (json['results'] as List)
          .map((item) => NewsArticle.fromJson(item))
          .toList(),
    );
  }
}

class NewsArticle {
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
  final List<Media> media;

  NewsArticle({
    required this.uri,
    required this.url,
    required this.id,
    required this.source,
    required this.publishedDate,
    required this.updated,
    required this.section,
    this.subsection,
    required this.nytdsection,
    required this.adxKeywords,
    this.column,
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

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      uri: json['uri'],
      url: json['url'],
      id: json['id'],
      source: json['source'],
      publishedDate: json['published_date'],
      updated: json['updated'],
      section: json['section'],
      subsection: json['subsection'],
      nytdsection: json['nytdsection'],
      adxKeywords: json['adx_keywords'],
      column: json['column'],
      byline: json['byline'],
      type: json['type'],
      title: json['title'],
      abstractText: json['abstract'],
      desFacet: List<String>.from(json['des_facet'] ?? []),
      orgFacet: List<String>.from(json['org_facet'] ?? []),
      perFacet: List<String>.from(json['per_facet'] ?? []),
      geoFacet: List<String>.from(json['geo_facet'] ?? []),
      media: (json['media'] as List)
          .map((item) => Media.fromJson(item))
          .toList(),
    );
  }
}

class Media {
  final String type;
  final String subtype;
  final String caption;
  final String copyright;
  final List<MediaMetadata> metadata;

  Media({
    required this.type,
    required this.subtype,
    required this.caption,
    required this.copyright,
    required this.metadata,
  });

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      type: json['type'],
      subtype: json['subtype'],
      caption: json['caption'],
      copyright: json['copyright'],
      metadata: (json['media-metadata'] as List)
          .map((item) => MediaMetadata.fromJson(item))
          .toList(),
    );
  }
}

class MediaMetadata {
  final String url;
  final String format;
  final int height;
  final int width;

  MediaMetadata({
    required this.url,
    required this.format,
    required this.height,
    required this.width,
  });

  factory MediaMetadata.fromJson(Map<String, dynamic> json) {
    return MediaMetadata(
      url: json['url'],
      format: json['format'],
      height: json['height'],
      width: json['width'],
    );
  }
}