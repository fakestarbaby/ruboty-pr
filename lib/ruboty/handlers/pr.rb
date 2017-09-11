module Ruboty
  module Handlers
    class PR < Base
      env :GITHUB_BASE_URL, "Pass GitHub URL if needed (e.g. https://github.example.com)", optional: true

      on(
        /remember (?<token>.+)\z/,
        name: "remember",
        description: "Remember sender's GitHub access token",
      )

      on(
        /pr since (?<since>today|yesterday)?\z/,
        name: "search_pull_requests",
        description: "Ouput pull requests as markdown",
      )

      def remember(message)
        Ruboty::PR::Actions::Remember.new(message).call
      end

      def search_pull_requests(message)
        Ruboty::PR::Actions::SearchPullRequests.new(message).call
      end
    end
  end
end
