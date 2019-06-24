class Section < ApplicationRecord
  include ActiveModel::Validations

  before_save :markdown_to_html

  belongs_to :event

  validates :title, :content_markdown, :status, :icon, :index, :event_id, presence: true
  validates :alternative_text, presence: true, if: :other_status?

  enum status: { active: 'A', inactive: 'I', other: 'O' }

  def self.human_status_types
    hash = {}
    statuses.each_key { |key| hash[I18n.t("enums.status_types.#{key}")] = key }
    hash
  end

  def other_status?
    status.eql?('other')
  end

  private

  def markdown_to_html
    config = MarkdownConfig.new

    renderer = Redcarpet::Render::HTML.new(config.options)
    markdown = Redcarpet::Markdown.new(renderer, config.extensions)

    self.content = markdown.render(content_markdown)
  end
end
