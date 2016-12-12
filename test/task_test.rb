Dir['./config/**/*.rb'].each do |f| require f rescue '' end
Dir['./app/**/*.rb'].each do |f| require f end

require 'oktobertest'
require 'byebug'

scope do
  setup do
    @task = Task.new
  end

  test 'fails if the task is empty' do
    assert !@task.valid?
  end

  test 'fails if the task is empty' do
    list = List.new title: 'Some list'
    @task.list = list
    @task.description = 'Some task description'
    assert @task.valid?
  end

  scope 'Temp Tasks' do
    setup do
      @task = TempTask.new
      list = List.new title: 'Some list'
      @task.list = list
      @task.description = 'Some task description'
      @task.start_date = Date.today - 4
      @task.end_date = Date.today + 4
    end

    test 'fails if the end_date is earlier than the start_date' do
        @task.start_date = Date.today + 4
        @task.end_date = Date.today - 4
      assert !@task.valid?
    end

    test 'task is expired if end date is earlier than today' do
      @task.start_date = Date.today - 20
      @task.end_date = Date.today - 1
      @task.set_expired #this sets the status to expired if task is expired
      assert @task.expired?
    end

    test 'task is not expired if end date is later than today' do
      @task.start_date = Date.today - 20
      @task.end_date = Date.today + 40
      @task.set_expired #this sets the status to expired if task is expired
      assert !@task.expired?
    end
  end

  scope 'Long Tasks' do
    setup do
      @task = LongTask.new
      list = List.new title: 'Some list'
      @task.list = list
      @task.description = 'Some task description'
    end

    test 'fails if the end_date is earlier than the start_date' do
      @task.percentage = 120
      assert !@task.valid?
    end

    test 'fails if the end_date is earlier than the start_date' do
      @task.percentage = 80
      assert @task.valid?
    end

    test 'fails if the end_date is earlier than the start_date' do
      @task.percentage = 0
      assert @task.valid?
    end
  end
end
