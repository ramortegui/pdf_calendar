defmodule PdfCalendarWeb.PageController do
  use PdfCalendarWeb, :controller

  def index(conn, _params) do
    changeset = PdfCalendar.Pcal.changeset(pdf_calendar_struct())
    render(conn, "index.html", changeset: changeset)
  end

  def download(conn, params) do
    changeset = PdfCalendar.Pcal.changeset(%PdfCalendar.Pcal{}, params["pcal"])

    case changeset.valid? do
      true ->
        month = changeset.params["month"]
        year = changeset.params["year"]
        {:ok, output} = Pcal.generate_pdf(%Pcal{month: month, year: year, output: pdf_name()})
        send_download(conn, {:file, output}, filename: "#{month}_#{year}.pdf")

      false ->
        render(conn, "index.html", changeset: %{changeset | action: 'create'})
    end
  end

  defp pdf_calendar_struct do
    date = DateTime.utc_now()

    %PdfCalendar.Pcal{
      month: date.month,
      year: date.year
    }
  end

  defp pdf_name do
    "/tmp/#{random()}.pdf"
  end

  defp random do
    64
    |> :crypto.strong_rand_bytes()
    |> Base.url_encode64()
    |> binary_part(0, 64)
  end
end
