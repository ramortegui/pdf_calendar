defmodule PdfCalendarWeb.PageView do
  use PdfCalendarWeb, :view

  def months do
    [
      January: 1,
      February: 2,
      March: 3,
      April: 4,
      May: 5,
      June: 6,
      July: 7,
      August: 8,
      September: 9,
      October: 10,
      November: 11,
      December: 12
    ]
  end

  def years do
    year = DateTime.utc_now().year
    (year - 10)..(year + 10)
  end

  def current_month do
    DateTime.utc_now().month
  end

  def current_year do
    DateTime.utc_now().year
  end
end
