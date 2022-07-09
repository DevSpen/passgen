require "commander"
require "./helpers/randomString.cr"

cli = Commander::Command.new do |cmd|
  cmd.use = "passgen"
  cmd.long = "Generate passwords on the fly."

  # TODO: Add options for filtering whether or not to include numbers, symbols, etc.

  cmd.flags.add do |flag|
    flag.name = "length"
    flag.short = "-l"
    flag.long = "--length"
    flag.default = 10
    flag.description = "The password length."
  end

  cmd.run do |options|
    len = options.int["length"]
    puts random_string len
  end

  cmd.commands.add do |cmd|
    cmd.use = "help"
    cmd.short = "Get info about the app."
    cmd.long = cmd.short
    cmd.run do
      puts cmd.help
    end
  end
end

Commander.run(cli, ARGV)
