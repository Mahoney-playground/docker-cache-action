# docker-cache-action

Example of caching the entire state of docker in `/var/lib/docker` in order to maintain the cache from a `RUN --mount=type=cache` command.

Note this is a pretty slow solution, somewhat defeating the objective of a cache! In a real world situation:
* running the `actions/cache@v2` to download the 1.6GB tar ball representing `/var/lib/docker` takes 38 seconds
* untarring it takes a further 13 seconds
* starting docker up again takes 5 seconds

So all told it takes 56 seconds to get docker up and running with the restored `/var/lib/docker`.

In addition, creating the tar ball at the end of the build takes 15 seconds & uploading it to wherever
`actions/cache@v2` puts it a further 45 seconds, so that's another minute at the end of your build.

In a real world example this still represents a saving of nearly 2 minutes, so can have value. See:
- [Cached build: 4m 42s](https://github.com/Mahoney-playground/goos/runs/3568034088?check_suite_focus=true)
- [Uncached build: 6m 38s](https://github.com/Mahoney-playground/goos/runs/3572927308?check_suite_focus=true) (excluding the 1m 43s which is cache creation related)

See [stackoverflow: How do I reuse the cache from a `RUN --mount=type=cache` docker build?](https://stackoverflow.com/questions/60448114/how-do-i-reuse-the-cache-from-a-run-mount-type-cache-docker-build/60485339?noredirect=1#comment120062963_60485339)
for more context.

May be made redundant when/if [buildkit #1512 Allow controlling cache mounts storage location](https://github.com/moby/buildkit/issues/1512) is done.
