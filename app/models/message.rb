require 'sanitize'

class Message < ApplicationRecord
  validates :name, :presence => true
  validates :email, :presence => true
  validates :subject, :presence => true
  validates :content, :presence => true

  CHECK_OPTIONS = ['robot', 'human', 'script']
  BOT_CHECK = 'robot'

  attr_writer :sanitizer

  def spammy?
    check != 'human'
  end

  def content_contains_html?
    sanitized_content != content.gsub(/\r/,'')
  end

  def subject_contains_html?
    sanitized_subject != subject
  end

  def contains_html?
    subject_contains_html? || content_contains_html?
  end

  def sanitizer
    @sanitizer || Sanitize
  end

  def sanitized_content
    sanitizer.clean(content)
  end

  def sanitized_subject
    sanitizer.clean(subject)
  end
end