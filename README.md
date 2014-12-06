# Cinch::Rssmonitor

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cinch-rssmonitor'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cinch-rssmonitor

## Usage

Use this setting to works.

```ruby
c.plugins.plugins = [Cinch::Plugins::RssMonitor]

c.plugins.options[Cinch::Plugins::RssMonitor] = {
   :rss_file => '/path/plugins/(your_file).yml'
}
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/cinch-rssmonitor/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
