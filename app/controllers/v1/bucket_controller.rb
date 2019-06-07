# frozen_string_literal: true

module V1
  class BucketController < ApplicationController
    # v1/list#index
    def index
      all = Bucket.all
      json_response(all, :ok)
    end

    # v1/list#create
    def create
      bucket = Bucket.create!(user_params)
      json_response(bucket, :created)
    end
    # v1/list#show
    # v1/list#update
    # v1/list#update
    # v1/list#destroy
    # v1/bucket#index
    # v1/bucket#create
    # v1/bucket#show
    # v1/bucket#update
    # v1/bucket#update
    # v1/bucket#destroy

    private

    def user_params
      params.permit(:title, :author, :user_id)
    end
  end
end
