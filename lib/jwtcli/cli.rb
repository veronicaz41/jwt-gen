require 'tty-prompt'

module Jwtcli
  class Cli
    def get_opts
      prompt = TTY::Prompt.new
      prompt.say("Starting with JWT token generation.")
      opts = {}
      i = 1
      while true do
        key = prompt.ask("Enter key #{i}:")
        if (key == "email")
          value = prompt.ask("Enter email value:") do |q|
            q.validate(/\A\w+@\w+\.\w+\Z/, "Invalid email address")
          end
        elsif (key == "user_id")
          value = prompt.ask("Enter user_id value:") do |q|
            q.required true
          end
        else
          value = prompt.ask("Enter #{key} value:")
        end
        opts[key] = value
        if opts["user_id"] && opts["email"]
          additional = prompt.yes?("Any additional inputs?(yes/no)")
          if !additional
            return opts
          end
        end
        i+=1
      end
    end
  end
end
