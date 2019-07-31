# frozen_string_literal: true

json.extract! task, :id, :list_id, :content, :created_at, :updated_at
json.url task_url(task, format: :json)
