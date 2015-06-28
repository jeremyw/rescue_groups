require_relative '../config/initializer'
require 'pry'
require 'webmock/rspec'
require_relative './fixtures/test_constants'

WebMock.disable_net_connect!(allow_localhost: true)

class TestResponse
  attr_reader :http_status_code, :parsed_body

  def initialize(code, body)
    @http_status_code = http_status_code
    @parsed_body      = body
  end

  def [](attribute)
    parsed_body[attribute]
  end

  def success?
    @parsed_body['status'] != 'error'
  end

  def error
    'It did not work'
  end
end

RSpec.configure do |config|
  fixtures_dir = "#{ File.dirname(__FILE__) }/fixtures/"
  post_url     = 'https://api.rescuegroups.org/http/json?apikey='
  headers      = { 'Content-Type' => 'application/json' }
  SUCCESS      = 200
  NOT_FOUND    = 404

  config.before(:each) do
    stub_request(
      :post,
      post_url)
      .with(
        body: JSON({
          objectAction: :publicView,
          objectType: :orgs,
          fields: OrganizationField.all,
          values: [{ orgID: TEST_ORG_ID }],
          apikey: ''
        }),
        headers: headers)
      .to_return(
        status: SUCCESS,
        body: File.read("#{ fixtures_dir }/organization/find.json"),
        headers: headers)

    stub_request(
      :post,
      post_url)
      .with(
        body: JSON({
          objectAction: :publicView,
          objectType: :orgs,
          fields: OrganizationField.all,
          values: [{ orgID: NOT_FOUND_ORG_ID }],
          apikey: ''
        }),
        headers: headers)
      .to_return(
        status: NOT_FOUND,
        body: '{}',
        headers: headers)

    stub_request(
      :post,
      post_url)
      .with(
        body: JSON({
          objectAction: :publicSearch,
          objectType: :orgs,
          search: {
            resultStart: 0,
            resultLimit: 10,
            resultSort: nil,
            resultOrder: :asc,
            calcFoundRows: 'Yes',
            filters: [{
              fieldName: :orgName,
              operation: :equal,
              criteria: TEST_ORG_NAME
            }],
            fields: OrganizationField.all,
          },
          apikey: ''
        }),
        headers: headers)
      .to_return(
        status: SUCCESS,
        body: File.read("#{ fixtures_dir }/organization/where.json"),
        headers: headers)

    stub_request(
      :post,
      post_url)
      .with(
        body: JSON({
          objectAction: :publicSearch,
          objectType: :orgs,
          search: {
            resultStart: 0,
            resultLimit: 10,
            resultSort: nil,
            resultOrder: :asc,
            calcFoundRows: 'Yes',
            filters: [{
              fieldName: :orgName,
              operation: :equal,
              criteria: NOT_FOUND_ORG_NAME
            }],
            fields: OrganizationField.all,
          },
          apikey: ''
        }),
        headers: headers)
      .to_return(
        status: SUCCESS,
        body: '{ "data": [] }',
        headers: headers)

    stub_request(
      :post,
      post_url)
      .with(
        body: JSON({
          objectAction: :publicSearch,
          objectType: :animals,
          search: {
            resultStart: 0,
            resultLimit: 10,
            resultSort: nil,
            resultOrder: :asc,
            calcFoundRows: 'Yes',
            filters: [{
              fieldName: :animalBreed,
              operation: :equal,
              criteria: TEST_ANIMAL_BREED
            }],
            fields: AnimalField.all,
          },
          apikey: ''
        }),
        headers: headers)
      .to_return(
        status: SUCCESS,
        body: File.read("#{ fixtures_dir }/animal/where.json"),
        headers: headers)

    stub_request(
      :post,
      post_url)
      .with(
        body: JSON({
          objectAction: :publicSearch,
          objectType: :animals,
          search: {
            resultStart: 0,
            resultLimit: 10,
            resultSort: nil,
            resultOrder: :asc,
            calcFoundRows: 'Yes',
            filters: [{
              fieldName: :animalOrgID,
              operation: :equal,
              criteria: TEST_ORG_ID
            }],
            fields: AnimalField.all,
          },
          apikey: ''
        }),
        headers: headers)
      .to_return(
        status: SUCCESS,
        body: File.read("#{ fixtures_dir }/animal/where.json"),
        headers: headers)

    stub_request(
      :post,
      post_url)
      .with(
        body: JSON({
          objectAction: :publicSearch,
          objectType: :animals,
          search: {
            resultStart: 0,
            resultLimit: 10,
            resultSort: nil,
            resultOrder: :asc,
            calcFoundRows: 'Yes',
            filters: [{
              fieldName: :animalBreed,
              operation: :equal,
              criteria: NOT_FOUND_ANIMAL_BREED
            }],
            fields: AnimalField.all,
          },
          apikey: ''
        }),
        headers: headers)
      .to_return(
        status: SUCCESS,
        body: '{ "data": [] }',
        headers: headers)

    stub_request(
      :post,
      post_url)
      .with(
        body: JSON({
          objectAction: :publicView,
          objectType: :animals,
          fields: AnimalField.all,
          values: [{ animalID: TEST_ANIMAL_ID }],
          apikey: ''
        }),
        headers: headers)
      .to_return(
        status: SUCCESS,
        body: File.read("#{ fixtures_dir }/animal/find.json"),
        headers: headers)

    stub_request(
      :post,
      post_url)
      .with(
        body: JSON({
          objectAction: :publicView,
          objectType: :animals,
          fields: AnimalField.all,
          values: [{ animalID: NOT_FOUND_ANIMAL_ID }],
          apikey: ''
        }),
        headers: headers)
      .to_return(
        status: NOT_FOUND,
        body: '{}',
        headers: headers)

    stub_request(
      :post,
      post_url)
      .with(
        body: JSON({
          objectAction: :publicView,
          objectType: :events,
          fields: EventField.all,
          values: [{ eventID: TEST_EVENT_ID }],
          apikey: ''
        }),
        headers: headers)
      .to_return(
        status: SUCCESS,
        body: File.read("#{ fixtures_dir }/event/find.json"),
        headers: headers)

    stub_request(
      :post,
      post_url)
      .with(
        body: JSON({
          objectAction: :publicView,
          objectType: :events,
          fields: EventField.all,
          values: [{ eventID: NOT_FOUND_EVENT_ID }],
          apikey: ''
        }),
        headers: headers)
      .to_return(
        status: NOT_FOUND,
        body: '{}',
        headers: headers)

    stub_request(
      :post,
      post_url)
      .with(
        body: JSON({
          objectAction: :publicSearch,
          objectType: :events,
          search: {
            resultStart: 0,
            resultLimit: 10,
            resultSort: nil,
            resultOrder: :asc,
            calcFoundRows: 'Yes',
            filters: [{
              fieldName: :eventName,
              operation: :equal,
              criteria: TEST_EVENT_NAME
            }],
            fields: EventField.all,
          },
          apikey: ''
        }),
        headers: headers)
      .to_return(
        status: SUCCESS,
        body: File.read("#{ fixtures_dir }/event/where.json"),
        headers: headers)

    stub_request(
      :post,
      post_url)
      .with(
        body: JSON({
          objectAction: :publicSearch,
          objectType: :events,
          search: {
            resultStart: 0,
            resultLimit: 10,
            resultSort: nil,
            resultOrder: :asc,
            calcFoundRows: 'Yes',
            filters: [{
              fieldName: :eventName,
              operation: :equal,
              criteria: NOT_FOUND_EVENT_NAME
            }],
            fields: EventField.all,
          },
          apikey: ''
        }),
        headers: headers)
      .to_return(
        status: SUCCESS,
        body: '{ "data": [] }',
        headers: headers)
  end
end
