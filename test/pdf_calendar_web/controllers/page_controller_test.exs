defmodule PdfCalendarWeb.PageControllerTest do
  use PdfCalendarWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "PdfCalendar"
  end
end
