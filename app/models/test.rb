class Test < ApplicationRecord
  include ApplicationHelper
  mount_uploader :attachment, AttachmentUploader

  attr_accessor :test_amount,
                :test_unit_of_meas,
                :present,
                :time_ago_amount,
                :time_ago_scale
  attr_reader :table_headings,
              :table_body

  before_create :concat_result,
                :timeify

  belongs_to :topic,
             required: true
  belongs_to :visit,
             inverse_of: :tests,
             required: false
  belongs_to :patient,
             inverse_of: :tests

  def concat_result
    if present === false
      self.result = 'absence'
    elsif present === true
      if !test_amount.blank? && !test_unit_of_meas.blank?
        self.result = "#{test_amount} #{test_unit_of_meas}"
      end
    end
  end

  def timeify
    if !time_ago_amount.nil? && !time_ago_scale.nil?
      self.absolute_start_date ||= find_date(time_ago_amount, time_ago_scale, Date.today)
      self.time_ago = "#{time_ago_amount} #{time_ago_scale} ago"
      true
    else
      self.absolute_start_date = created_at
      true
    end
    true
  end

  def self.attributes
    %i[visit_id topic_id patient_id test present absolute_start_date time_ago test_amount test_unit_of_meas time_ago_amount time_ago_scale result note attachment]
  end

  def self.table_headings
    %w[Date Name Result Attachments Actions]
  end

  def table_body
    action_view = ActionView::Base.new(Rails.configuration.paths["app/views"])
    action_view.class_eval do
      include Rails.application.routes.url_helpers
      include ApplicationHelper

      def protect_against_forgery?
        false
      end
    end

    {
      'date': absolute_start_date.strftime('%B %Y'),
      'name': find_trail(topic_id),
      'result': print_if_present(self.result),
      'attachment': action_view.render(
        partial: 'layouts/attachment_thumbnails',
        format: :txt,
        locals: { model: self }
      ).to_s.html_safe,
      'actions': action_view.render(
        partial: 'tests/link_buttons',
        format: :txt,
        locals: { t: self }
      ).to_s.html_safe
    }
  end

  def generate_summary
    return "#{self.topic.name} was #{self.result}"
  end

  def generate_full_summary
    generate_summary
  end
end
