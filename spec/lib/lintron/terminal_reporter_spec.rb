require 'rails_helper'
require 'lintron/terminal_reporter'

describe Lintron::TerminalReporter do
  context 'with no violations' do
    it 'should say it has no violations' do
      expect(Lintron::TerminalReporter.new.format_violations([])).to include 'No violations found!'
    end
  end

  context 'with violations' do
    it 'should have some output' do
      violation_line =
        Lintron::ViolationLine.new(
          message: 'you broke a rule',
          path: 'user.rb',
          line: 123,
        )

      output = Lintron::TerminalReporter.new.format_violations([violation_line])

      expect(output).to_not include 'No violations found!'
      expect(output).to include 'you broke a rule'
    end
  end

  describe '#wrap_pretty' do
    it 'wraps long lines' do
      allow(TermInfo).to receive(:screen_size) { [20, 40] }
      long_string = 'This is a long string, used to test the word wrap functionality. Wrap it.'
      wrapped_string = Lintron::TerminalReporter.new.wrap_pretty(long_string, 0)
      expect(wrapped_string.lines.length).to eq 2
    end
  end
end
