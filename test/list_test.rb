Dir['./config/**/*.rb'].each do |f| require f rescue '' end
Dir['./app/**/*.rb'].each do |f| require f end

require 'oktobertest'
require 'byebug'

scope do
  setup do
    @list = List.new
  end

  test 'fails if the list title is not present' do
    assert !@list.valid?
    assert @list.errors.messages[:title] == ["can't be blank"]
  end

  test 'succeeds if slug is unique' do
    @list.title = 'asdf'
    assert @list.valid?
  end
end
