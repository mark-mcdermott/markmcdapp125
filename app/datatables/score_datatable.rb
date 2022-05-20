class ScoreDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      value: { source: "Score.value" },
      user_id: { source: "Score.user_id" },
      date: { source: "Score.date" }
    }
  end

  def data
    records.map do |record|
      {
        value: record.value,
        user_id: record.user_id
        date: record.date,
        DT_RowId: record.id
      }
    end
  end

  def get_raw_records
    Score.all
  end

end
