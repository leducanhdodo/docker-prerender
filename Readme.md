# docker-prerender

Dockerfile to build the prerender container image

## About

Prerender is a node server from prerender.io that uses phantomjs to create
static HTML out of a javascript page. It is perfect for AngularJS SEO,
BackboneJS SEO, EmberJS SEO, and any other javascript framework

## Available Environment Variables

- `BASIC_AUTH_USERNAME` and `BASIC_AUTH_PASSWORD` enabled the
  [basicAuth](https://github.com/prerender/prerender#basicauth) plugin.
- `ALLOWED_DOMAINS` enables the
  [whitelist](https://github.com/prerender/prerender#whitelist) plugin.
- `BLACKLISTED_DOMAINS` enables the
  [blacklist](https://github.com/prerender/prerender#blacklist) plugin.
- `S3_BUCKET_NAME` enables the
  [s3HtmlCache](https://github.com/prerender/prerender#s3htmlcache) plugin.
    * `AWS_ACCESS_KEY_ID`, required if not using EC2 IAM Roles.
    * `AWS_SECRET_ACCESS_KEY`, ditto.
    * `AWS_REGION`, defaults to "us-east-1", set differently if desired.
- `LOGGER` enableds the [logger](https://github.com/prerender/prerender#logger)
  plugin.
- `REDIS_URL` enables the
  [redis](https://www.npmjs.com/package/prerender-redis-cache) plugin.
    * `PAGE_TTL` sets the seconds to cache a page. 0 means forever. Default is
      1 day.
