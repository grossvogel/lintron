require 'rails_helper'

describe IssueComment do
  let(:pr) do
    pr = PullRequest.new(org: 'test-org', repo: 'test', pr_number: 123)
    mock_commit = OpenStruct.new sha: 'deadbeef'
    allow(pr).to receive(:latest_commit).and_return mock_commit
    pr
  end

  let(:issue_comment) do
    IssueComment.new(pr: pr, body: 'Issue comment test')
  end

  describe '#message' do
    it 'returns the body' do
      expect(issue_comment.message).to eq 'Issue comment test'
    end
  end

  describe '#hash' do
    it 'is stable' do
      expect(issue_comment.hash).to eq issue_comment.dup.hash
    end
  end

  describe '#==' do
    it 'treats two comments with the same PR and has body as equal' do
      expect(issue_comment).to eq issue_comment.dup
    end
  end

  describe '#eql?' do
    it 'treats two comments with the same PR and has body as equal' do
      expect(issue_comment.eql?(issue_comment.dup)).to eq true
    end
  end
end
