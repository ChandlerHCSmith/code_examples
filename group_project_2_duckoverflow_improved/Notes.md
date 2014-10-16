# Duck Overflow

## Application

Search does not work...

(may be related to....)

## No Tests

On an application of this scale it's really not OK to have testing be an
afterthought.  The expectation of the business world will be that a feature
isn't a feature unless it comes with the appropriate level of testing.

You could have at least _installed_ a few tests.  You could put pending tests
e.g.

    it "does something"
    it "does something else"

which would make them _pending_ tests.  That's better than nothing.  You might
be thinking, "I'll implement features and then go back and write tests."  That
never happens.

Also writing tests drives out focused design.  _Use this to your advantage_.

# Migrations

Nice.  Constrained with polymorphic magic included.  Someone read the docs.

## Routes

Sensible.  Good approach, but something is screaming out for a
`votes` resource to me

You don't take advantage of Rails' named routes near enough.  You're in the
business of composing magical strings of URL.  This is disadvantageous.
Embrace using the named routes.

## Views

Simple and clear.

## seeds

It's really nice to have some seeded data
