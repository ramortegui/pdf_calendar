defmodule PdfCalendar.PcalTest do
  use ExUnit.Case

  test 'with valida data' do
    changeset = PdfCalendar.Pcal.changeset(%PdfCalendar.Pcal{}, %{year: "2019", month: "1"})
    assert(changeset.valid?)
  end
end
