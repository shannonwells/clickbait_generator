RSpec::Matchers.define :be_a_json_response do

  JSON_CONTENT_TYPE = 'application/json'
  match do |actual|
    (actual.content_type) == JSON_CONTENT_TYPE
  end

  failure_message do |actual|
    "expected content type to be #{JSON_CONTENT_TYPE}"
  end

  failure_message_when_negated do |actual|
    "expected content type not to be #{JSON_CONTENT_TYPE}"
  end

  description do
    "be an #{JSON_CONTENT_TYPE} response"
  end

end
