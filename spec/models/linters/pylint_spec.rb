require 'rails_helper'

describe Linters::Pylint do
  let(:good_file) do
    OpenStruct.new(
      pathname: 'example.py',
      extname: '.py',
      blob: <<~PY
        def example(param):
            print param
      PY
    )
  end

  let(:bad_file) do
    OpenStruct.new(
      pathname: 'example.py',
      extname: '.py',
      blob: <<~PY
        def example():
            x             = 1
            long_variable = 3
      PY
    )
  end

  context 'with good file' do
    describe '#run' do
      it 'returns no lints for good files' do
        violations = Linters::Pylint.new.run(good_file)
        expect(violations).to be_empty
      end
    end
  end

  context 'with bad file' do
    describe '#run' do
      it 'returns lints for bad files' do
        violations = Linters::Pylint.new.run(bad_file)
        expect(violations).to_not be_empty
      end
    end
  end
end
