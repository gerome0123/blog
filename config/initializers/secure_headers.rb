# rubocop:disable Lint/PercentStringArray
SecureHeaders::Configuration.default do |config|
  config.hsts = Rails.env.production? && { max_age: 100.years.to_i, include_subdomains: true }
  config.x_frame_options = 'DENY'
  config.x_content_type_options = 'nosniff'
  config.x_xss_protection = '1; mode=block'
  config.x_download_options = 'noopen'
  config.csp = {
    report_only: true,
    default_src: %w[https: 'self'],
    img_src: %w['self' data: *.google-analytics.com bam.nr-data.net stats.g.doubleclick.net
                https://ssl.gstatic.com/],
    frame_src: %w['self' https://www.google.com/recaptcha/],
    connect_src: %w['self'],
    font_src: %w['self' data:], # TODO: Remove `data:` since it's not safe.
    media_src: %w['self'],
    object_src: %w['self'],
    style_src: %w['self' 'unsafe-inline'],
    script_src: %w['self' 'unsafe-inline' 'unsafe-eval'
                   *.google-analytics.com *.googletagmanager.com
                   https://apis.google.com https://www.google.com/recaptcha/
                   *.newrelic.com bam.nr-data.net https://www.gstatic.com/recaptcha/],
    report_uri: %w[https://report-uri.io/report/7d9dec471aafbe8327f31bcb0e2dfa8b]
  }
end
