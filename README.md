# Ruboty::PR
Output pull requests as markdown via Ruboty.

## Install
```ruby
# Gemfile
gem "ruboty-pr"
```

## Usage
```
@ruboty pr since {today|yesterday} - Output pull requests as markdown
@ruboty remember <token>           - Remember sender's GitHub access token
```

## ENV
```
GITHUB_BASE_URL - Pass GitHub base URL if needed (e.g. https://github.example.com)
```
