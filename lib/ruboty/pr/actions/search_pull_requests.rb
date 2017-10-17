module Ruboty
  module PR
    module Actions
      class SearchPullRequests < Base
        def call
          if has_access_token?
            list
          else
            require_access_token
          end
        end

        private

        def list
          message.reply(search_summary, code: true)
        end

        def search_summary
          if issues.empty?
            empty_summary
          else
            repositories.sort.map do |repo_name, repo_issues|
              repo_issues.map do |issue|
                "* [#{(issue.state == "closed") ? "x" : " "}] [#{repo_name}##{issue.number}: #{issue.title}](#{issue.html_url})"
              end.join("\n")
            end.join("\n")
          end
        end

        def empty_summary
          "Issue not found"
        end

        def repositories
          repos = Hash.new { |hash, key| hash[key] = [] }
          issues.each do |issue|
            next unless issue.pull_request
            repo_name = issue.repository.name
            repos[repo_name] << issue
          end
          repos
        end

        def issues
          @issues ||= search_result
        end

        def search_result
          client.issues(nil, state: "all", since: since)
        end

        def since
          case message[:since]
            when "today" then
              Date.today.midnight.iso8601
            when "yesterday" then
              Date.yesterday.midnight.iso8601
          end
        end
      end
    end
  end
end
