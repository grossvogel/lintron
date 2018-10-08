require 'rails_helper'

describe Linters::SCSSLint do
  before(:each) do
    @scss_source = <<-SCSS
body {
  padding: 0; // margin should be first
  margin: 0;
}
    SCSS

    @linter_config = <<-CONFIG
scss_files: "**/*.scss"

linters:
  PropertySortOrder:
    enabled: false

    CONFIG
  end

  it 'can lint without error' do
    file = StubFile.new(
      path: 'test.scss',
      blob: @scss_source,
    )

    lints = Linters::SCSSLint.new.run(file)

    expect(lints).to_not be_empty
  end

  it 'can use a custom linter config' do
    config = LinterConfigFile.from_content(@linter_config)
    file = StubFile.new(
      path: 'test.scss',
      blob: @scss_source,
    )

    lints = Linters::SCSSLint.new(config).run(file)
    expect(lints).to be_empty
  end
end
