class ExecuteSql
  attr_reader :result, :columns, :rows, :error

  def initialize(query)
    @query = query
    @rows = []
    @columns = []
    @result = nil
  end

  def run
    @result = ActiveRecord::Base.connection.exec_query(@query)
    @columns = result.columns
    @rows = result.rows
    self
  rescue ActiveRecord::StatementInvalid => e
    @columns, @rows = [], []
    @error = e.message
    Honeybadger.context(sql_query: @query, failure: 'Fatal', name: 'executing query failed')
    Honeybadger.notify(@error)
    self
  end

  def error?
    error.present?
  end

  def single_result(col_name = 'count')
    raise Exception, "Error in SQL Query - #{error}" if error?

    data.first[col_name] if data.present?
  end

  def unique_data
    data.uniq
  end

  def data
    raise Exception, "Error in SQL Query - #{error}" if error?

    result&.to_hash
  end

  def fetch_column(col)
    data&.map { |r| r[col] }
  end
end
