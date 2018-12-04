module Linters
  class Pylint < Linters::Base
    LINT_LINE_PATTERN = /(?<tmpfile>[^:]+):(?<line_number>[0-9]+): (?<severity>warning|error) \((?<rule>[^\)]+)\) (?<message>.+)/

    def run(file)
      scratch_file = Tempfile.new(file.extname)
      scratch_file.write(file.blob)
      scratch_file.flush
      scratch_file.rewind

      lint_string = IO.popen(cmd(scratch_file), 'r+') do |f|
        f.read
      end

      scratch_file.close
      scratch_file.unlink

      return lints(file, lint_string)
    end

    def cmd(file)
      <<-CMD.squish
        pylint #{file.path} #{config_opt} --msg-template='{path}:{line}: {category} ({msg_id} {symbol}, {obj}) {msg}'
      CMD
    end

    def config_opt
      return '' unless @linter_config
      "--rcfile #{@linter_config.path}"
    end

    def lints(file, lint_string)
      lint_string.lines.each_with_object([]) do |line, list|
        match_data = LINT_LINE_PATTERN.match(line)
        next if match_data.blank?
        list << Violation.new(
          file: file,
          line: match_data[:line_number].to_i,
          message: match_data[:message],
          linter: Linters::Pylint,
        )
      end
    end

    def self.config_filename
      '.pylintrc'
    end
  end
end

Linters.register(:py, Linters::Pylint)
