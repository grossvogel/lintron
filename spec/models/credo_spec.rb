require 'rails_helper'

describe Linters::Credo do
  let(:module_def_no_docs) do
    <<-ELIXIR
      defmodule MissingModuleDoc do

        def function_without_docs() do
          if 1 > 2 do
            "Beep"
          else
            "Boop"
          end
        end
      end
    ELIXIR
  end

  it 'returns a moduledoc lint' do
    file = StubFile.new(
      path: 'test.ex',
      blob: module_def_no_docs,
    )

    lints = Linters::Credo.new.run(file)

    expect(lints).to_not be_empty
  end

  it 'uses config override allowing missing moduledoc' do
    file = StubFile.new(
      path: 'test.ex',
      blob: module_def_no_docs,
    )
    linter_config = LinterConfigFile.from_path(
      file_fixture('credo_allow_missing_doc.exs').to_s
    )

    lints = Linters::Credo.new(linter_config).run(file)

    expect(lints).to be_empty
  end
end
