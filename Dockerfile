FROM sickp/alpine-ruby:2.4.2-r1

RUN apk update && apk add musl libc6-compat gdb musl-dbg make gcc musl-dev

WORKDIR /app
COPY . .
RUN bundle install
CMD ["ruby", "trace.rb"]
