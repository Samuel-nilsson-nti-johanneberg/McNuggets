require_relative 'spec_helper'

describe 'Request' do

    describe 'Simple get-request' do

        it 'parses the http verb' do
            @request = Request.new(File.read('./example_requests/get-index.???'))
            _(@request.verb).must_equal "GET"
        end

        it 'parses the resource' do
            @request = Request.new(File.read('./example_request'))