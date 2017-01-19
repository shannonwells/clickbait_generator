RSpec::Matchers.define :be_a_json_response do

  def json_content_type
    @json_content_type ||= 'application/json'
  end

  match do |actual|
    (actual.content_type) == json_content_type
  end

  failure_message do |actual|
    "expected content type to be #{json_content_type}"
  end

  failure_message_when_negated do |actual|
    "expected content type not to be #{json_content_type}"
  end

  description do
    "be an #{json_content_type} response"
  end

end
