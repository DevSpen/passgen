require "commander"
require "colorize"
require "./helpers/random_string.cr"

cli = Commander::Command.new do |cmd|
  cmd.use = "passgen"
  cmd.long = "Generate passwords on the fly."

  cmd.flags.add do |flag|
    flag.name = "length"
    flag.short = "-L"
    flag.long = "--length"
    flag.default = 10
    flag.description = "The password length."
  end

   cmd.flags.add do |flag|
    flag.name = "numbers"
    flag.short = "-n"
    flag.long = "--numbers"
    flag.default = false
    flag.persistent  = true
    flag.description = "Whether to include numbers in the password."
  end

  cmd.flags.add do |flag|
    flag.name = "symbols"
    flag.short = "-s"
    flag.long = "--symbols"
    flag.default = false
    flag.persistent  = true
    flag.description = "Whether to include special symbols in the password."
  end

  cmd.flags.add do |flag|
    flag.name = "lowercase"
    flag.short = "-l"
    flag.long = "--lowercase"
    flag.default = false
    flag.persistent  = true
    flag.description = "Whether to include lowercase letters in the password."
  end

  cmd.flags.add do |flag|
    flag.name = "uppercase"
    flag.short = "-u"
    flag.long = "--uppercase"
    flag.default = false
    flag.persistent  = true
    flag.description = "Whether to include uppercase letters in the password."
  end

  # Command logic to generate a password.
  cmd.run do |options|
    len = options.int["length"]
    chars = [] of Char

    if options.bool["numbers"]
      chars.push('0', '1', '2', '3', '4', '5', '6', '7', '8', '9')
    end

    if options.bool["symbols"]
      chars.push('!', '@', '#', '$', '%', '^', '&', '*', '(', ')')
    end

    if options.bool["lowercase"]
      chars.push('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z')
    end

    if options.bool["uppercase"]
      chars.push('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z')
    end

    if chars.size == 0
      puts "ERROR: ".colorize.fore(:white).back(:red).mode(:bold).to_s + "Please use flags to specify the characters to include using flags."
      puts cmd.help
      exit
    end

    puts "Here's your password: #{random_string(len, chars).colorize(:cyan)}"
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
