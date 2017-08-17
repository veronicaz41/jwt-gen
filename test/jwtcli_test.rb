require 'test_helper'

class JwtcliTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Jwtcli::VERSION
  end
end
