require 'test_helper'
require 'jwt'

class GenTest < Minitest::Test
  include Jwtcli

  def test_option_payload_should_be_hash
    assert_raises ArgumentError do
      Gen.new(0)
    end
    assert_raises ArgumentError do
      Gen.new({})
    end
  end

  def test_user_id_required
    assert_raises ArgumentError do
      Gen.new({key: "value"})
    end
    assert_raises ArgumentError do
      Gen.new({key: "value", user_id: nil})
    end
    assert_raises ArgumentError do
      Gen.new({key: "value", user_id: ""})
    end
  end

  def test_email_required
    assert_raises ArgumentError do
      Gen.new({user_id: "123"})
    end
    assert_raises ArgumentError do
      Gen.new({user_id: "123", email: nil})
    end
    assert_raises ArgumentError do
      Gen.new({user_id: "123", email: ""})
    end
  end

  def test_validate_email
    assert_raises ArgumentError do
      Gen.new({user_id: "123", email: "something"})
    end
  end

  def test_encode
    payload = {
      :user_id => "123",
      :email => "v@gmail.com"
    }
    token = Gen.new(payload).encode
    assert_equal "eyJ0eXAiOiJKV1QiLCJhbGciOiJub25lIn0.eyJ1c2VyX2lkIjoiMTIzIiwiZW1haWwiOiJ2QGdtYWlsLmNvbSJ9.", token
    decoded_token = JWT.decode(token, nil, false)
    assert_equal(decoded_token[0]["user_id"], payload[:user_id])
    assert_equal(decoded_token[0]["email"], payload[:email])
  end

  def test_encode_with_multiple_keypairs
    payload = {
      :user_id => "123",
      :email => "v@gmail.com",
      :name => "linda",
      :role => "admin"
    }
    token = Gen.new(payload).encode
    assert_equal "eyJ0eXAiOiJKV1QiLCJhbGciOiJub25lIn0.eyJ1c2VyX2lkIjoiMTIzIiwiZW1haWwiOiJ2QGdtYWlsLmNvbSIsIm5hbWUiOiJsaW5kYSIsInJvbGUiOiJhZG1pbiJ9.", token
    decoded_token = JWT.decode(token, nil, false)
    assert_equal(decoded_token[0]["user_id"], payload[:user_id])
    assert_equal(decoded_token[0]["email"], payload[:email])
    assert_equal(decoded_token[0]["name"], payload[:name])
    assert_equal(decoded_token[0]["role"], payload[:role])
  end
end
